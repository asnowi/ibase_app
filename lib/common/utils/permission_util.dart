import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {

  ///检查是否有权限
  ///[permission] 权限
  ///return 是否有权限
  Future<bool> checkPermissions(Permission permission) async {
    var status = await permission.status;
    if (status.isDenied) {
      return false;
    } else if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      // 永久拒绝，仅支持Android
      return false;
    } else if (status.isRestricted) {
      //仅支持iOS
      return false;
    } else {
      return false;
    }
  }

  // /// 启动时请求权限
  // static Future<String> applyLaunchPermission() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.location,
  //     Permission.storage,
  //     Permission.camera,
  //     if (Global.isIOS) Permission.photos,
  //   ].request();
  //   return statuses.toString();
  // }
  //
  // static Future<bool> location() async {
  //   if (await Permission.location.serviceStatus != ServiceStatus.enabled) {
  //     throw ("位置服务未打开");
  //   }
  //   await Permission.location.request();
  //   if (await Permission.location.isGranted) {
  //     return true;
  //   } else if (await Permission.location.isDenied) {
  //     await Permission.location.request();
  //     if (await Permission.location.isGranted) {
  //       return true;
  //     } else {
  //       throw ("您取消了位置授权");
  //     }
  //   } else if (await Permission.locationWhenInUse.isPermanentlyDenied) {
  //     throw ("您拒绝了位置授权，请在设置中打开");
  //   } else {
  //     throw ("位置授权未知错误");
  //   }
  // }
  //
  // static Future<bool> camera() async {
  //   await Permission.camera.request();
  //   if (await Permission.camera.isGranted) {
  //     return true;
  //   } else if (await Permission.camera.isDenied) {
  //     await Permission.camera.request();
  //     if (await Permission.camera.isGranted) {
  //       return true;
  //     } else {
  //       throw ("您取消了相机授权");
  //     }
  //   } else if (await Permission.camera.isPermanentlyDenied) {
  //     throw ("您拒绝了相机授权，请在设置中打开");
  //   } else {
  //     throw ("相机授权未知错误");
  //   }
  // }
  //
  // static Future<bool> microphone() async {
  //   await Permission.microphone.request();
  //   if (await Permission.microphone.isGranted) {
  //     return true;
  //   } else if (await Permission.microphone.isDenied) {
  //     await Permission.microphone.request();
  //     if (await Permission.microphone.isGranted) {
  //       return true;
  //     } else {
  //       throw ("您取消了麦克风授权");
  //     }
  //   } else if (await Permission.microphone.isPermanentlyDenied) {
  //     throw ("您拒绝了麦克风授权，请在设置中打开");
  //   } else {
  //     throw ("麦克风授权未知错误");
  //   }
  // }
  //
  // static Future<bool> storage() async {
  //   await Permission.storage.request();
  //   if (await Permission.storage.isGranted) {
  //     return true;
  //   } else if (await Permission.storage.isDenied) {
  //     await Permission.storage.request();
  //     if (await Permission.storage.isGranted) {
  //       return true;
  //     } else {
  //       throw ("您取消了文件存储授权");
  //     }
  //   } else if (await Permission.storage.isPermanentlyDenied) {
  //     throw ("您拒绝了文件存储授权，请在设置中打开");
  //   } else {
  //     throw ("文件存储授权未知错误");
  //   }
  // }
  //
  // static Future<bool> photos() async {
  //   await Permission.photos.request();
  //   if (await Permission.photos.isGranted) {
  //     return true;
  //   } else if (await Permission.photos.isDenied) {
  //     await Permission.photos.request();
  //     if (await Permission.photos.isGranted) {
  //       return true;
  //     } else {
  //       throw ("您取消了相册授权");
  //     }
  //   } else if (await Permission.photos.isPermanentlyDenied) {
  //     throw ("您拒绝了相册授权，请在设置中打开");
  //   } else {
  //     throw ("相册授权未知错误");
  //   }
  // }
  //
  // /// 定位适用用
  // static Future<bool> locationPermissionRequest() async {
  //   return await location();
  // }
  //
  // /// 拍视频适用
  // static Future<bool> videoPermissionRequest() async {
  //   return await camera() && await microphone() && await storage() && await photos();
  // }
  //
  // /// 拍照片适用
  // static Future<bool> cameraPermissionRequest() async {
  //   return await camera() && await storage() && await photos();
  // }
  //
  // /// 扫描适用
  // static Future<bool> qrCodePermissionRequest() async {
  //   return await camera();
  // }
  //
  // /// 上传下载适用
  // static Future<bool> filePermissionRequest() async {
  //   return await storage() && await photos();
  // }
}