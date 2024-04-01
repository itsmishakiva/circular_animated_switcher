import 'package:flutter/material.dart';
import 'package:theme_animation/circular_switcher/circular_switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode mode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return CircularSwitcher(
      relativeOffset: const Offset(1, 0),
      padding: const EdgeInsets.only(right: 30.0, top: 90),
      duration: const Duration(milliseconds: 600),
      child: MaterialApp(
        key: UniqueKey(),
        title: 'Flutter Demo',
        themeMode: mode,
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      mode == ThemeMode.dark
                          ? mode = ThemeMode.light
                          : mode = ThemeMode.dark;
                    });
                  },
                  child: const Icon(Icons.sunny),
                ),
              )
            ],
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
