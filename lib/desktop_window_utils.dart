import 'dart:async';

import 'package:flutter/services.dart';

class DesktopWindowUtils {
  static const MethodChannel _channel =
      const MethodChannel('desktop_window_utils');

  static Future<bool?> closeWindow() async {
    return await _channel.invokeMethod('closeWindow');
  }

  static Future<bool?> minimizeWindow() async {
    return await _channel.invokeMethod('minimizeWindow');
  }

  static Future<bool?> showWindow() async {
    return await _channel.invokeMethod('showWindow');
  }

  static Future<bool?> setMinimumSize({
    required double height,
    required double width,
  }) async {
    return await _channel.invokeMethod('setMinimumSize', {
      'height': height,
      'width': width,
    });
  }

  static Future<bool?> setFrameSize({
    required double height,
    required double width,
  }) async {
    return await _channel.invokeMethod('setFrameSize', {
      'height': height,
      'width': width,
    });
  }

  static Future<void> useToolbar({
    bool isUsingToolbar = false,
  }) async {
    _channel.invokeMethod('useToolbar', {
      'isUsingToolbar': isUsingToolbar,
    });
  }

  static Future<void> setTopbarSpecifications({
    bool isUsingToolbar = false,
    bool isDividerInvisible = false,
  }) async {
    _channel.invokeMethod('setTopbarSpecifications', {
      'isUsingToolbar': isUsingToolbar,
      'isDividerInvisible': isDividerInvisible,
    });
  }
}
