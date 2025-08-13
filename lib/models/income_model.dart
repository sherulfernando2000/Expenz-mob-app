import 'package:flutter/material.dart';

enum IncomeCategory { freelance, salary, passive, sales }

//Category Images
final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.freelance: "assets/images/freelance.png",
  IncomeCategory.salary: "assets/images/salary.png",
  IncomeCategory.passive: "assets/images/car.png",
  IncomeCategory.sales: "assets/images/salary.png",
};

//category colors
final Map<IncomeCategory, Color> IncomeCategoryColor = {
  IncomeCategory.freelance: const Color(0XFFE57373),
  IncomeCategory.passive: const Color(0xFF81C784),
  IncomeCategory.sales: const Color(0xFF64B5F6),
  IncomeCategory.salary: const Color(0xFFFFD54F),
};

class Income {
  final int id;
  final String title;
  final double amount;
  final IncomeCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });
}
