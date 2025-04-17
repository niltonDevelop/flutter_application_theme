import 'package:flutter/material.dart';
import 'package:flutter_application_theme/app_color_scheme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  //metodo para cambiar el tema
  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

//Extencion
extension ColorExtension on BuildContext {
  AppColorScheme get color => AppColorScheme.of(this);
}
