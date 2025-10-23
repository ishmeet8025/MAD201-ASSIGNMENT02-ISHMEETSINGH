/// Course: MAD201
/// Assignment: 2
/// Student: Ishmeet Singh
/// Student ID: A00202436
/// Description: Home screen showing the list of all expenses and a total summary.

import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'add_expense_screen.dart';
import 'expense_detail_screen.dart';
import '../widgets/expense_card.dart';

/// Displays the list of all user expenses.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Holds all expenses temporarily in memory.
  List<Expense> expenses = [];

  /// Computes total expenses for summary.
  double get totalExpense =>
      expenses.fold(0, (sum, item) => sum + item.amount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Expense Tracker')),
      body: Column(
        children: [
          // Total Expense Summary displayed at the top.
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Total: \$${totalExpense.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // ListView showing all expenses (if any)
          Expanded(
            child: expenses.isEmpty
                // Show message when list is empty
                ? const Center(child: Text('No expenses added yet.'))
                // Build expense cards for each item
                : ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      final expense = expenses[index];
                      return ExpenseCard(
                        expense: expense,
                        onTap: () {
                          // Navigate to detail screen when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ExpenseDetailScreen(expense: expense),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),

      // Floating button to add a new expense
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to AddExpenseScreen and wait for result
          final newExpense = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
          );

          // If a new expense was returned, add it to the list
          if (newExpense != null && newExpense is Expense) {
            setState(() {
              expenses.add(newExpense);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
