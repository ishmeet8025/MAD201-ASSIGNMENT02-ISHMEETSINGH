/// Course: MAD201
/// Assignment: 2
/// Student: Ishmeet Singh
/// Student ID: A00202436
/// Description: Main entry point for the Personal Expense Tracker App.
/// This app allows users to add, view, and manage their daily expenses.

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ExpenseApp());
}

/// The root widget of the app.
class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(), // Start app at Home Screen
    );
  }
}
