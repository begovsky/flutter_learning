import 'package:flutter/material.dart';
import 'package:quizz_app/quizz_summary/summary_item.dart';

class QuizzSummary extends StatelessWidget {
  const QuizzSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
