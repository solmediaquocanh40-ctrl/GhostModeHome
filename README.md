# GhostModeHome 1.0.0

Ẩn/hiện toàn bộ icon màn hình chính bằng **cử chỉ tuỳ chỉnh** để khoe trọn hình nền. Chạm lại đúng cử chỉ để hiện về.

## Cách dùng

- **Mặc định: chạm 3 lần vào vùng trống** trên màn hình chính để ẩn/hiện icon.
  Cố ý KHÔNG dùng chạm 2 lần để tránh xung đột với DoubleTapToLock (chạm 2 lần tắt màn hình).
- Cử chỉ chỉ nhận khi chạm vào **vùng trống** — chạm trúng icon vẫn mở app bình thường.
- Vào **Cài đặt → GhostModeHome** để bật thêm cử chỉ khác (có thể bật nhiều cử chỉ cùng lúc):
  hai ngón chạm 2 lần, bóp hai ngón, hai ngón vuốt xuống, lắc máy, chạm 2 lần vào thanh trạng thái.
- Tuỳ chọn ẩn kèm: thanh Dock, chấm chuyển trang, nút Tìm kiếm (iOS 16).
- Hiệu ứng: vật lý **lò xo** cho mọi chuyển động + **lan sóng** theo khoảng cách từ điểm chạm.
  Chỉnh được thời gian hiệu ứng và mức thu nhỏ trong Cài đặt.

## An toàn

- Đang ẩn icon mà vào chế độ sửa màn hình (jiggle) → icon tự hiện lại.
- Khoá máy rồi mở khoá → icon tự hiện lại (bật mặc định, tắt được trong Cài đặt).
- Quên cử chỉ? Tắt "Bật GhostModeHome" trong Cài đặt là icon hiện về ngay.

## Build

Đẩy toàn bộ cây thư mục này lên GitHub rồi chạy workflow **Build GhostModeHome**
(tab Actions) — workflow build sẵn 3 bản: **rootful**, **rootless**, **roothide** (macos-14, SDK iPhoneOS16.5).
Tải file `.deb` ở phần Artifacts của mỗi job và cài bằng trình quản lý gói quen thuộc.

- Package: `com.vn.ghostmodehome`
- Target: SpringBoard, iOS 15/16 (đã nhắm iPhone 12 Pro, iOS 16.3.1)
- Cài đặt: PreferenceLoader plist thuần (không cần PreferenceBundle biên dịch)
- Log gỡ lỗi (khi bật trong Cài đặt): `/var/mobile/Documents/GhostModeHome.log`

## Lưu ý kỹ thuật

- Tweak dò class/phương thức lúc chạy (SBIconView, SBIconListView, SBDockView,
  SBHPageDotsView, SBHSearchPillView...) và bỏ qua an toàn nếu không thấy,
  nên ít nguy cơ crash khi iOS đổi chi tiết nội bộ.
- Widget trên trang Today (vuốt sang tráiสุด) không bị ẩn — tweak chỉ xử lý
  các trang icon chính + Dock.
