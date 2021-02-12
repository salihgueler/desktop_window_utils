import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DesktopWindowUtils {
  static const MethodChannel _channel = const MethodChannel('desktop_window_utils');

  static Future<void> closeWindow() async {
    await _channel.invokeMethod('closeWindow');
  }

  static Future<void> minimizeWindow() async {
    await _channel.invokeMethod('minimizeWindow');
  }

  static Future<void> showWindow() async {
    await _channel.invokeMethod('showWindow');
  }

  static Future<void> setMinimumSize({
    @required double height,
    @required double width,
  }) async {
    _channel.invokeMethod('setMinimumSize', {
      'height': height,
      'width': width,
    });
  }

  static Future<void> setFrameSize({
    @required double height,
    @required double width,
  }) async {
    _channel.invokeMethod('setFrameSize', {
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
