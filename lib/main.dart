import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isDark = ValueNotifier<bool>(false);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: HomePage(isDark: isDark),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.isDark});
  final ValueNotifier isDark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: Card(
            color: Colors.grey.shade400,
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
                      border: Border.all(color: Colors.blue, width: 5),
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
                    children: [const Text('Empresa:'), const Text('SAP')],
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
