import 'package:flutter/material.dart';
import 'package:wanllet/common/app_colors.dart';

class ItemTransactions extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String value;
  final bool isSpend;

  const ItemTransactions({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.value,
    required this.isSpend
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: whiteColor, shape: BoxShape.circle),
          child: Image.asset(imagePath, height: 24, width: 24),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: whiteColor,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
        Text(
          "Rp.$value",
          style: TextStyle(
            color: isSpend?redColor:greenColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
