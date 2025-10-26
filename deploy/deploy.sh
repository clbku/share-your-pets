# --- CẤU HÌNH CỦA BẠN ---
AWS_REGION="ap-southeast-1"       # <-- Thay bằng Region của bạn
REPOSITORY_NAME="syp/syp"          # <-- Thay bằng tên repo của bạn
LOCAL_IMAGE_TAG="latest"          # <-- Thay bằng tag của bạn
# ------------------------

# 1. Lấy Account ID
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REPO_URI="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
IMAGE_URI="${REPO_URI}/${REPOSITORY_NAME}:${LOCAL_IMAGE_TAG}"

# 2. Đăng nhập Docker vào ECR
# (Lệnh này sẽ tự động dùng quyền từ IAM Role)
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $REPO_URI

# 3. Pull image của bạn về
echo "Đang pull image: $IMAGE_URI"
docker pull $IMAGE_URI


docker run -d -p 80:80  $IMAGE_URI

