import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),

  dividerTheme: const DividerThemeData(color: Colors.white24),

  textTheme: TextTheme(
    labelSmall: TextStyle(
      color: Colors.white.withValues(alpha: 0.6),
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),

    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),

    headlineMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 24,
    ),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 165, 135, 255),
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
  ),
);
