import 'package:flutter/material.dart';

class AppColorScheme extends InheritedWidget {
  final Brightness brightness;
  final TargetPlatform platform;

  const AppColorScheme({
    super.key,
    required super.child,
    required this.brightness,
    required this.platform,
  });

  static AppColorScheme of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<AppColorScheme>();
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;

    final platform = Theme.of(context).platform;

    return inherited ??
        AppColorScheme(brightness: brightness, platform: platform, child: const SizedBox.shrink());
  }

  Color get card {
    return brightness == Brightness.dark ? Colors.black12 : Colors.white60;
  }

  Color get avatar {
    return brightness == Brightness.dark ? Colors.grey.shade900 : Colors.green.shade200;
  }

  @override
  bool updateShouldNotify(covariant AppColorScheme oldWidget) {
    return brightness != oldWidget.brightness || platform != oldWidget.platform;
  }
}
