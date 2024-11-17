import 'dart:async';
import 'package:flutter/services.dart';

class IotFlashlightPlugin {
  static const MethodChannel _channel = MethodChannel('iot_flashlight_plugin');

  /// Toggles the flashlight on/off.
  /// Returns `true` if the flashlight is on, `false` if off.
  /// Throws a `PlatformException` or
  /// `UnsupportedError` for unsupported platforms.
  static Future<bool?> toggleFlashlight() async {
    try {
      // Invoke the native method via MethodChannel.
      final bool? isOn = await _channel.invokeMethod<bool>('toggleFlashlight');
      return isOn;
    } on PlatformException catch (e) {
      if (e.code == 'NO_CAMERA') {
        throw Exception('No camera with flashlight found on this device.');
      } else if (e.code == 'CAMERA_ERROR') {
        throw Exception('Error accessing the camera.');
      } else if (e.code == 'UNSUPPORTED') {
        throw UnsupportedError('Flashlight toggle is not supported on this platform.');
      } else {
        throw Exception('Unknown error: ${e.message}');
      }
    }
  }
}
