import 'package:flutter/foundation.dart';
import 'package:platform_device_id/platform_device_id.dart';

class DeviceInfo {
  String? token;
  String? deviceId;
  String? platform;

  DeviceInfo({
    this.token,
    this.deviceId,
    this.platform,
  });

  Future<DeviceInfo> getDeviceInfo(String? token) async {
    String? deviceId = '';
    final platform = defaultTargetPlatform.toString();

    deviceId = kIsWeb ? 'web' : await PlatformDeviceId.getDeviceId;

    return DeviceInfo(token: token, deviceId: deviceId, platform: platform);
  }
}
