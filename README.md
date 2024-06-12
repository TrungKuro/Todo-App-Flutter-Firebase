# todo_app_firebase

## Cài đặt Firebase cho ứng dụng.

> Nguồn:
> - Cách cũ (thủ công) - [Flutter Firebase Setup | How to Connect Firebase with Flutter 2023](https://www.youtube.com/watch?v=keZL9K2ZmH4).
> - Cách mới (tự động) dành cho Flutter - [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?platform=android).
> - Video - [Firebase x Flutter Masterclass](https://www.youtube.com/watch?v=0RWLaJxW7Oc).
>
> ---
>
> Cách tìm **[ Android package name ]** cho Android:
> - Nguồn: [Android Installation](https://firebase.flutter.dev/docs/manual-installation/android/).
> - Trong thư mục dự án, mở file `android/app/build.gradle` đây là tệp Gradle cấp ứng dụng (app-level).
> - Tìm đến `defaultConfig` bạn sẽ thấy thông tin `applicationId`.
>
> Cách tìm **[ Apple bundle ID ]** cho iOS:
> - Nguồn: [iOS Installation](https://firebase.flutter.dev/docs/manual-installation/ios/).
> - Mở `XCode`.
> - Mở file `ios/Runner.xcworkspace` trong thư mục dự án.
> - Tại thanh điều hướng bên trái, chọn `Runner` để xem toàn bộ thông tin dự án.
> - Mở tab `General` bạn sẽ thấy thông tin `Bundle Identifier` tại mục `Identity`.
>
> ---
>
> <u>Step1</u>: Cách cài đặt **[ Firebase Command Line Interface (CLI) ]**.
>
> - Yêu cầu:
>   - Trước tiên phải cài đặt **Node.js**.
>   - Bởi vì **Node.js** đi kèm với `npm`, một công cụ quản lý gói cho JavaScript.
>   - Nếu đã cài xong hoặc cài rồi có thể nhập lệnh `node -v` để kiểm tra phiên bản hiện tại.
> - Nhập lệnh: `sudo npm install -g firebase-tools` để cài đặt hoặc cập nhập.
> - Nhập lệnh: `firebase --version` để kiểm tra đã cài đặt chưa hoặc kiểm tra phiên bản hiện tại.
> - Nhập lệnh: `firebase login` để kiểm tra đã đăng nhập hay chưa? (đăng nhập với Gmail sử dụng dịch vụ Firebase).
> - Nhập lệnh: `flutter pub global activate flutterfire_cli` để cài đặt toàn cầu (global) gói `flutterfire_cli` cho **Flutter**.
> - Nhập lệnh: `export PATH="$PATH":"$HOME/.pub-cache/bin"` (nếu có theo yêu cầu từ kết quả lệnh trên) để thêm thư mục `$HOME/.pub-cache/bin` vào biến môi trường `PATH`.
>
> <u>Step2</u>: Thiết lập cấu hình cho ứng dụng của bạn để sử dụng Firebase.
>
> - Yêu cầu: tạo **[ Firebase projects ]** cho ứng dụng nếu chưa có.
> - Nhập lệnh: `flutterfire configure`, chọn *"Firebase projects"* để định cấu hình với ứng dụng **Flutter** của bạn, rồi chọn "Platforms" mà ứng dụng của bạn có hỗ trợ.
>
> <u>Step3</u>: Khởi tạo Firebase trong ứng dụng của bạn.
>
> - Nhập lệnh: `flutter pub add firebase_core` để thêm gói `firebase_core` vào dự án **Flutter** của bạn.
> - Trong tệp `lib/main.dart`, hãy khởi tạo Firebase bằng cách sử dụng đối tượng `DefaultFirebaseOptions` được xuất bởi tệp cấu hình:
>
> ```Dart
> void main() async {
>   WidgetsFlutterBinding.ensureInitialized();
>   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
>   runApp(const MainApp());
> }
> ```
>
> <u>Step4</u>: Thêm plugin Firebase.
>
> - Bạn truy cập Firebase trong ứng dụng **Flutter** của mình thông qua các `plugin Firebase` **Flutter** khác nhau, 1 plugin cho 1 sản phẩm Firebase.
> - Nhập lệnh: `flutter pub add PLUGIN_NAME` để thêm plugin Firebase cho dự án **Flutter** của bạn, trong đó `PLUGIN_NAME` là tên `plugin Firebase`.

## Các vấn đề

> Lỗi khi build app:
>
> <pre>
> Error: CocoaPods's specs repository is too out-of-date to satisfy dependencies.
>
> To update the CocoaPods specs, run:
>   pod repo update
> </pre>
>
> - Trên VSCode của thư mục dự án, mở Terminal và truy cập vào thư mục ios bằng lệnh: `cd my_flutter_project/ios`.
> - Nhập lệnh: `pod repo update` để cập nhật kho lưu trữ đặc tả của **CocoaPods**.
>
> **CocoaPods** là một trình quản lý phụ thuộc được sử dụng trong các dự án iOS để quản lý các thư viện của bên thứ ba. Kho lưu trữ đặc tả chứa thông tin về các phiên bản hiện có của các thư viện này.