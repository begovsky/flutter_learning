import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList(
      {super.key, required this.expenses, required this.onDeleteExpense});

  final List<Expense> expenses;
  void Function(int) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                ),
              ),
              key: ValueKey(expenses[index].id),
              onDismissed: (DismissDirection direction) {
                onDeleteExpense(index);
              },
              child: ExpenseItem(
                expenses[index],
              ),
            ));
  }
}
