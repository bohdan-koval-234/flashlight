// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flashlight/flashlight_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

/// A web implementation of the FlashlightPlatform of the Flashlight plugin.
class FlashlightWeb extends FlashlightPlatform {
  /// Constructs a FlashlightWeb
  FlashlightWeb();

  static void registerWith(Registrar registrar) {
    FlashlightPlatform.instance = FlashlightWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = web.window.navigator.userAgent;
    return version;
  }
}
