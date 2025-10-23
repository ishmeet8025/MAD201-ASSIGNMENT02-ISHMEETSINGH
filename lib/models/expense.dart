/// Course: MAD201
/// Assignment: 2
/// Student: Ishmeet Singh
/// Student ID: A00202436
/// Description: Defines the Expense data model used across the Expense Tracker App.

/// Represents a single expense entry.
class Expense {
  /// Title of the expense (e.g., "Lunch", "Groceries").
  final String title;

  /// Amount of money spent.
  final double amount;

  /// Optional description or notes for the expense.
  final String description;

  /// Date when the expense occurred.
  final DateTime date;

  Expense({
    required this.title,
    required this.amount,
    required this.description,
    required this.date,
  });
}
