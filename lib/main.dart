import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_theme/app_color_scheme.dart';
import 'package:flutter_application_theme/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = ValueNotifier<bool>(false);
    return MultiProvider(
      providers: [ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider())],
      child: Consumer(
        builder: (_, ThemeProvider themeProvider, __) {
          final isDarkTheme = themeProvider.themeMode == ThemeMode.dark;
          return AppColorScheme(
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
            platform: defaultTargetPlatform,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              home: HomePage(isDark: isDark),
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: themeProvider.themeMode,
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.isDark});
  final ValueNotifier isDark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.avatar,
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.85,
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: Card(
            color: context.color.card,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: context.color.avatar, width: 5),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/img/avatar.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text('Nombre de usuario:'), const Text('ngonzano')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text('correo:'), const Text('niltongr@outlook.com')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Modo Dark'),
                      ValueListenableBuilder(
                        valueListenable: isDark,
                        builder: (context, isDarkMode, child) {
                          return Switch.adaptive(
                            value: isDarkMode,
                            onChanged: (value) {
                              isDark.value = value;
                              context.read<ThemeProvider>().toggleTheme(value);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
