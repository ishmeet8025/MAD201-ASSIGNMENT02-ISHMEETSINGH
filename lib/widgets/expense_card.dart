/// Course: MAD201
/// Assignment: 2
/// Student: Ishmeet Singh
/// Student ID: A00202436
/// Description: Reusable card widget displaying basic expense info on the Home Screen.

import 'package:flutter/material.dart';
import '../models/expense.dart';

/// Displays a single expense in a card format.
class ExpenseCard extends StatelessWidget {
  final Expense expense;
  final VoidCallback onTap;

  const ExpenseCard({super.key, required this.expense, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        title: Text(expense.title), // Display expense title
        subtitle: Text(
          'Date: ${expense.date.toLocal()}'.split(' ')[0],
        ),
        trailing: Text('\$${expense.amount.toStringAsFixed(2)}'), // Amount on right side
        onTap: onTap, // Tap to view details
      ),
    );
  }
}
