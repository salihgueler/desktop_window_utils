import 'package:flutter/material.dart';
import 'package:window_utils/window_utils.dart';

void main() {
  runApp(WindowUtilsShowcaseApp());
}

class WindowUtilsShowcaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white54,
        body: WindowUtilsShowcaseButtonsPage(),
      ),
    );
  }
}

class WindowUtilsShowcaseButtonsPage extends StatefulWidget {
  @override
  _WindowUtilsShowcaseButtonsPageState createState() =>
      _WindowUtilsShowcaseButtonsPageState();
}

class _WindowUtilsShowcaseButtonsPageState
    extends State<WindowUtilsShowcaseButtonsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(
            'Use toolbar',
          ),
          onTap: () async {
            WindowUtils.useToolbar(isUsingToolbar: true);
          },
        ),
        ListTile(
          title: Text(
            'Set minimum screen size to 300x300',
          ),
          onTap: () async {
            WindowUtils.setMinimumSize(height: 300, width: 300);
          },
        ),
        ListTile(
          title: Text(
            'Set screen size to 400x400',
          ),
          onTap: () async {
            WindowUtils.setFrameSize(height: 400, width: 400);
          },
        ),
        ListTile(
          title: Text(
            'Close the Window',
          ),
          onTap: () async {
            WindowUtils.closeWindow();
          },
        ),
        ListTile(
          title: Text(
            'Minimize the Window',
          ),
          onTap: () async {
            WindowUtils.minimizeWindow();
          },
        ),
        ListTile(
          title: Text(
            'Remove divider for Titlebar',
          ),
          onTap: () async {
            WindowUtils.setTopbarSpecifications(isDividerInvisible: true);
          },
        ),
        ListTile(
          title: Text(
            'Remove divider for Toolbar',
          ),
          onTap: () async {
            WindowUtils.setTopbarSpecifications(
              isDividerInvisible: true,
              isUsingToolbar: true,
            );
          },
        ),
      ],
    );
  }
}
