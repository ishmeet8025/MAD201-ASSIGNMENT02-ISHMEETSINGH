/// Course: MAD201
/// Assignment: 2
/// Student: Ishmeet Singh
/// Student ID: A00202436
/// Description: Displays all details of a selected expense.

import 'package:flutter/material.dart';
import '../models/expense.dart';

/// Displays details of one selected expense.
class ExpenseDetailScreen extends StatelessWidget {
  final Expense expense;

  const ExpenseDetailScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title display
            Text('Title: ${expense.title}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),

            // Amount display
            Text('Amount: \$${expense.amount.toStringAsFixed(2)}'),
            const SizedBox(height: 8),

            // Date display
            Text('Date: ${expense.date.toLocal()}'.split(' ')[0]),
            const SizedBox(height: 8),

            // Description display
            Text('Description:\n${expense.description}'),
          ],
        ),
      ),
    );
  }
}
