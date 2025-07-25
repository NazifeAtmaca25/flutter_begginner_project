import 'package:flutter/material.dart';
import 'package:to_do_list/todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          checkboxTheme: CheckboxThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.blue; // ✅ Tik varsa mavi olsun
                }
                return null; // ❌ Tik yoksa varsayılan kalsın (gri)
              },
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.blue),
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)))),
      home: const Todolist(),
    );
  }
}
