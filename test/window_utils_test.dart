import 'package:desktop_window_utils/desktop_window_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('desktop_window_utils');

  TestWidgetsFlutterBinding.ensureInitialized();

  group('Window operations without parameters', () {
    bool closeWindowCalled = false;
    bool minimizeWindowCalled = false;
    bool showWindowCalled = false;

    setUp(() {
      channel.setMockMethodCallHandler((MethodCall call) async {
        if (call.method == 'closeWindow') {
          closeWindowCalled = true;
        } else if (call.method == 'minimizeWindow') {
          minimizeWindowCalled = true;
        } else if (call.method == 'showWindow') {
          showWindowCalled = true;
        } else {
          throw MissingPluginException();
        }
      });
    });

    test('DesktopWindowUtils.closeWindow() is called', () async {
      await DesktopWindowUtils.closeWindow();
      expect(closeWindowCalled, isTrue);
    });

    test('DesktopWindowUtils.minimizeWindow() is called', () async {
      await DesktopWindowUtils.minimizeWindow();
      expect(minimizeWindowCalled, isTrue);
    });

    test('DesktopWindowUtils.showWindow() is called', () async {
      await DesktopWindowUtils.showWindow();
      expect(showWindowCalled, isTrue);
    });

    tearDown(() {
      channel.setMethodCallHandler(null);
      closeWindowCalled = false;
      minimizeWindowCalled = false;
      showWindowCalled = false;
    });
  });

  group('Window operations with parameters', () {
    double width = 0;
    double height = 0;
    bool isUsingToolbar = false;
    bool isDividerInvisible = false;

    setUp(() {
      channel.setMockMethodCallHandler((MethodCall call) async {
        if (call.method == 'setMinimumSize') {
          width = call.arguments['width'] as double;
          height = call.arguments['height'] as double;
        } else if (call.method == 'setFrameSize') {
          width = call.arguments['width'] as double;
          height = call.arguments['height'] as double;
        } else if (call.method == 'useToolbar') {
          isUsingToolbar = call.arguments['isUsingToolbar'] as bool;
        } else if (call.method == 'setTopbarSpecifications') {
          isUsingToolbar = call.arguments['isUsingToolbar'] as bool;
          isDividerInvisible = call.arguments['isDividerInvisible'] as bool;
        } else {
          throw MissingPluginException();
        }
      });
    });

    test(
      'DesktopWindowUtils.setMinimumSize(height: 400, width: 200) is called',
      () async {
        await DesktopWindowUtils.setMinimumSize(height: 400, width: 200);
        expect(width, 200);
        expect(height, 400);
      },
    );

    test(
      'DesktopWindowUtils.setFrameSize(height: 200, width: 100) is called',
      () async {
        await DesktopWindowUtils.setFrameSize(height: 200, width: 100);
        expect(width, 100);
        expect(height, 200);
      },
    );

    test('DesktopWindowUtils.useToolbar(isUsingToolbar: true) is called', () async {
      await DesktopWindowUtils.useToolbar(isUsingToolbar: true);
      expect(isUsingToolbar, isTrue);
    });

    test('DesktopWindowUtils.useToolbar() is called', () async {
      await DesktopWindowUtils.useToolbar();
      expect(isUsingToolbar, isFalse);
    });

    test('DesktopWindowUtils.setTopbarSpecifications() is called', () async {
      await DesktopWindowUtils.setTopbarSpecifications();
      expect(isUsingToolbar, isFalse);
      expect(isDividerInvisible, isFalse);
    });

    test(
      'DesktopWindowUtils.setTopbarSpecifications(isUsingToolbar: true, isDividerInvisible: true) is called',
      () async {
        await DesktopWindowUtils.setTopbarSpecifications(
          isUsingToolbar: true,
          isDividerInvisible: true,
        );
        expect(isUsingToolbar, isTrue);
        expect(isDividerInvisible, isTrue);
      },
    );

    tearDown(() {
      width = 0;
      height = 0;
      isUsingToolbar = false;
      isDividerInvisible = false;
    });
  });
}
