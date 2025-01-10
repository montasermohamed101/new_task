import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

DeviceType getDeviceType(double width) {
  if (width >= 1024) {
    return DeviceType.desktop;
  } else if (width >= 600) {
    return DeviceType.tablet;
  } else {
    return DeviceType.mobile;
  }
}

class ResponsiveScaffold extends StatelessWidget {
  final Widget? mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final bool resizeToAvoidBottomInset;
  const ResponsiveScaffold({
    super.key,
    this.mobileBody,
    this.tabletBody,
    this.desktopBody,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset = true,
  }) : assert(mobileBody != null || tabletBody != null || desktopBody != null);

  @override
  Widget build(BuildContext context) {
    // Obtain the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine the device type based on screen width
    DeviceType deviceType = getDeviceType(screenWidth);

    // Select the appropriate body widget
    Widget body;
    switch (deviceType) {
      case DeviceType.desktop:
        body = desktopBody!;
        break;
      case DeviceType.tablet:
        body = tabletBody!;
        break;
      case DeviceType.mobile:
      default:
        body = mobileBody!;
    }

    return Scaffold(
      appBar: appBar,
      drawer: deviceType == DeviceType.mobile ? drawer : null,
      // Show drawer only on mobile
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
