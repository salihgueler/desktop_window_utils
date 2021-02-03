import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WindowUtils {
  static const MethodChannel _channel = const MethodChannel('window_utils');

  static Future<void> minimizeWindow() async {
    await _channel.invokeMethod('minimizeWindow');
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
}
