# Build Docker image

#!/bin/bash
#
# Script này sẽ build một Docker image và đẩy (push) nó lên Amazon ECR.
#
# YÊU CẦU:
# 1. Đã cài đặt AWS CLI và cấu hình (đã chạy 'aws configure')
# 2. Đã cài đặt Docker và đang chạy.
# 3. Một tệp 'Dockerfile' tồn tại trong cùng thư mục.
#
# CÁCH SỬ DỤNG:
# 1. Chỉnh sửa 3 biến trong phần "CẤU HÌNH" bên dưới.
# 2. Cấp quyền thực thi: chmod +x build.sh
# 3. Chạy script: ./build.sh
#

# Dừng script ngay lập tức nếu bất kỳ lệnh nào thất bại
set -e

# --- (1) CẤU HÌNH CỦA BẠN ---
# Thay đổi 3 giá trị này cho phù hợp với dự án của bạn
AWS_REGION="ap-southeast-1"       # Ví dụ: us-east-1, ap-southeast-1
REPOSITORY_NAME="syp/syp"          # Tên ECR repository của bạn (phải tồn tại)
LOCAL_IMAGE_TAG=$(git rev-parse --short HEAD)
# --- KẾT THÚC CẤU HÌNH ---


echo "===== Bắt đầu quá trình Build & Push ECR ====="

# --- (2) TỰ ĐỘNG LẤY THÔNG TIN ---
# Lấy AWS Account ID từ AWS CLI
echo "Đang lấy AWS Account ID..."
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

if [ -z "$AWS_ACCOUNT_ID" ]; then
    echo "LỖI: Không thể lấy AWS Account ID. Hãy đảm bảo AWS CLI đã được cấu hình."
    exit 1
fi
echo "AWS Account ID: $AWS_ACCOUNT_ID"

# Tạo URI đầy đủ của ECR registry và image
REPO_URI="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
IMAGE_URI="${REPO_URI}/${REPOSITORY_NAME}:latest"

echo "Region: $AWS_REGION"
echo "Image URI đầy đủ: $IMAGE_URI"
echo "----------------------------------------"


# --- (3) BUILD IMAGE ---
echo "Bước 1: Đang build Docker image..."
# Build image và tag nó với tên local trước
docker build -t ${REPOSITORY_NAME}:${LOCAL_IMAGE_TAG} -f ./deploy/Dockerfile --build-arg VITE_MAPBOX_TOKEN=pk.eyJ1IjoiY29uZ2x5MTMxMSIsImEiOiJjbWc4Mnc2cGEwMzQ0MmxxMDJlb2xjYWV1In0.IxN96EFc9YPzdN8Wd0mNFg --platform linux/amd64 .

echo "Build image local thành công: ${REPOSITORY_NAME}:${LOCAL_IMAGE_TAG}"
echo "----------------------------------------"


# --- (4) XÁC THỰC ECR ---
echo "Bước 2: Đang xác thực Docker với ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $REPO_URI
echo "Xác thực ECR thành công."
echo "----------------------------------------"


# --- (5) GẮN THẺ (TAG) IMAGE ---
echo "Bước 3: Đang gắn thẻ (tag) image..."
docker tag ${REPOSITORY_NAME}:${LOCAL_IMAGE_TAG} $IMAGE_URI
echo "Đã tag image: ${REPOSITORY_NAME}:${LOCAL_IMAGE_TAG} -> ${IMAGE_URI}"
echo "----------------------------------------"


# --- (6) ĐẨY (PUSH) IMAGE ---
echo "Bước 4: Đang đẩy (push) image lên ECR..."
docker push $IMAGE_URI
echo "----------------------------------------"

echo ""
echo "THÀNH CÔNG!"
echo "Đã đẩy image thành công lên: $IMAGE_URI"
echo "========================================"
