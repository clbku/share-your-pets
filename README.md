# Share Your Pets 🐾

Ứng dụng chia sẻ thông tin thú cưng toàn cầu dựa trên bản đồ tương tác. Người dùng có thể đăng thông tin thú cưng của mình và xem các thú cưng khác trên toàn thế giới.

## ✨ Tính năng chính

### 🗺️ Bản đồ tương tác làm trung tâm
- **Giao diện map-centric**: Bản đồ toàn màn hình với các điều khiển floating
- **Hiển thị marker thú cưng**: Mỗi thú cưng được đăng sẽ hiển thị marker trên bản đồ
- **Popup thông tin**: Click vào marker để xem thông tin chi tiết thú cưng
- **Navigation mượt mà**: Zoom và pan trên bản đồ một cách tự nhiên

### 🏠 Cửa sổ quản lý thú cưng
- **Modal overlay**: Cửa sổ quản lý dạng popup có thể mở/đóng
- **Thêm thú cưng mới**: Form đăng thông tin thú cưng với vị trí
- **Quản lý danh sách**: Xem, sửa, xóa thông tin thú cưng đã đăng
- **Thống kê real-time**: Hiển thị số lượng thú cưng tổng, thất lạc, an toàn

### 🎮 Điều khiển floating
- **Nút quản lý thú cưng**: Mở cửa sổ quản lý với badge hiển thị số lượng
- **Cảnh báo thú cưng thất lạc**: Badge đỏ khi có thú cưng thất lạc
- **Bảng thông tin bản đồ**: Hiển thị tọa độ và zoom level hiện tại
- **Toggle controls**: Bật/tắt các panel thông tin

### 📱 Responsive Design
- **Mobile-friendly**: Giao diện tối ưu cho mọi kích thước màn hình
- **Smooth animations**: Hiệu ứng chuyển động mượt mà
- **Modern UI**: Sử dụng Chakra UI v3 với thiết kế hiện đại

## 🚀 Cài đặt và chạy

### Yêu cầu
- Node.js 18+
- npm hoặc pnpm

### Cài đặt
```bash
# Clone repository
git clone <repository-url>
cd share-your-pets

# Cài đặt dependencies
npm install
# hoặc
pnpm install
```

### Cấu hình Mapbox
1. Tạo file `.env` từ `.env.example`:
```bash
cp .env.example .env
```

2. Thêm Mapbox token vào file `.env`:
```
VITE_MAPBOX_TOKEN=pk.YourActualMapboxTokenHere
```

### Chạy ứng dụng
```bash
npm run dev
# hoặc
pnpm dev
```

Truy cập http://localhost:5173 để sử dụng ứng dụng.

## 🎯 Cách sử dụng

### 1. Xem bản đồ
- Bản đồ sẽ tự động định vị vị trí hiện tại của bạn
- Sử dụng mouse để zoom in/out và di chuyển bản đồ
- Click vào marker để xem thông tin thú cưng

### 2. Thêm thú cưng mới
- Click nút **Pet Management** (🐾) ở góc trên trái
- Click **"Thêm Pet mới"** trong cửa sổ quản lý
- Điền thông tin: tên, loại, mô tả, trạng thái (thất lạc/an toàn)
- Chọn vị trí trên bản đồ hoặc sử dụng vị trí hiện tại
- Click **"Thêm Pet"** để hoàn tất

### 3. Quản lý thú cưng
- Trong cửa sổ quản lý, bạn có thể:
  - **Xem danh sách**: Tất cả thú cưng đã đăng
  - **Sửa thông tin**: Click icon edit trên mỗi pet
  - **Xóa**: Click icon delete (cần xác nhận)
  - **Xem vị trí**: Click icon location để zoom đến vị trí pet trên bản đồ

### 4. Theo dõi thông tin
- **Bảng thông tin**: Toggle bằng nút ℹ️ để xem tọa độ bản đồ
- **Badge cảnh báo**: Số đỏ trên nút quản lý hiển thị tổng số pets
- **Thống kê**: Trong cửa sổ quản lý có thống kê chi tiết

## 🛠️ Công nghệ sử dụng

- **Frontend**: React 18 + TypeScript + Vite
- **UI Framework**: Chakra UI v3
- **Map**: Mapbox GL JS
- **Icons**: React Icons
- **State Management**: React Hooks
- **Styling**: CSS3 + CSS Modules

## 📁 Cấu trúc dự án

```
src/
├── components/          # React components
│   ├── MapPopup.tsx    # Popup hiển thị trên map
│   ├── PetCard.tsx     # Card hiển thị thông tin pet
│   ├── PetForm.tsx     # Form thêm/sửa pet
│   ├── PetList.tsx     # Danh sách pets
│   └── PetManagement.tsx # Cửa sổ quản lý chính
├── hooks/              # Custom React hooks
│   ├── useGeolocation.ts # Hook lấy vị trí hiện tại
│   ├── useMapboxMap.ts  # Hook quản lý Mapbox map
│   ├── usePetMapLayer.ts # Hook quản lý layer pets
│   └── usePets.ts      # Hook quản lý state pets
├── types/              # TypeScript type definitions
│   └── Pet.ts          # Type definitions cho Pet
├── data/               # Sample data
│   └── samplePets.ts   # Dữ liệu pets mẫu
├── App.tsx             # Component chính
└── main.tsx            # Entry point
```

## 🎨 Thiết kế UX/UI

### Nguyên tắc thiết kế
- **Map-centric**: Bản đồ là trung tâm, các chức năng là overlay
- **Minimalist**: Giao diện sạch sẽ, không làm phân tán người dùng
- **Accessible**: Dễ sử dụng cho mọi đối tượng người dùng
- **Responsive**: Hoạt động tốt trên mọi thiết bị

### Color Scheme
- **Primary**: Blue gradient (#667eea → #764ba2)
- **Success**: Green cho pets an toàn
- **Warning**: Red/Orange cho pets thất lạc
- **Neutral**: Gray tones cho UI elements

## 🤝 Đóng góp

Mọi đóng góp đều được chào đón! Vui lòng:

1. Fork repository
2. Tạo feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Tạo Pull Request

## 📄 License

Dự án được phân phối dưới MIT License. Xem file `LICENSE` để biết thêm chi tiết.

---

Được phát triển với ❤️ cho cộng đồng yêu thú cưng toàn cầu 🌍🐾
