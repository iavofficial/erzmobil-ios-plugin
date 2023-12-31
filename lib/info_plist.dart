
import 'dart:async';

import 'package:flutter/services.dart';

class InfoPlist {
  static const MethodChannel _channel =
      const MethodChannel('info_plist');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> get debugVersion async {
    final bool debug = await _channel.invokeMethod('isDebugVersion');
    return debug;
  }
}
