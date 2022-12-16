import 'package:flutter/material.dart';
import 'package:projectcode/RegistrationPage.dart';

void main()
{
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(
          color: Colors.red,
        ),

        iconTheme: IconThemeData(
          color: Colors.red,
        ),

        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Colors.red,
          ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Colors.red,
              )
            )
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.red
          )
        )

     ),

      home: const RegistrationPage(),
    );
  }
}
