/// Course: MAD201
/// Assignment: 2
/// Student: Ishmeet Singh
/// Student ID: A00202436
/// Description: Screen for adding a new expense. Includes validation and date selection.

import 'package:flutter/material.dart';
import '../models/expense.dart';

/// Screen for adding new expenses.
class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  // Global key used for form validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Variable to store selected date
  DateTime? _selectedDate;

  /// Opens a date picker to choose an expense date.
  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default to today's date
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    // Update selected date if user picked one
    if (pickedDate != null) {
      setState(() => _selectedDate = pickedDate);
    }
  }

  /// Validates input and creates a new Expense object.
  void _saveExpense() {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      // Create a new expense object from form inputs
      final newExpense = Expense(
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        description: _descriptionController.text,
        date: _selectedDate!,
      );

      // Return new expense to the previous screen
      Navigator.pop(context, newExpense);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Expense')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign form key for validation
          child: ListView(
            children: [
              // Expense title input
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a title' : null,
              ),

              // Amount input field (numbers only)
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter an amount' : null,
              ),

              // Description input field (multi-line)
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a description' : null,
              ),

              const SizedBox(height: 20),

              // Row for date selection
              Row(
                children: [
                  Text(_selectedDate == null
                      ? 'No date chosen'
                      : 'Date: ${_selectedDate!.toLocal()}'.split(' ')[0]),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _pickDate,
                    child: const Text('Pick Date'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Save button
              ElevatedButton(
                onPressed: _saveExpense,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
