import 'package:flutter/material.dart';
import 'package:wanllet/common/app_colors.dart';

class MainFeature extends StatelessWidget {
  final String imagePath;
  final String title;

  const MainFeature({
    super.key,
    required this.imagePath,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: white9percent,
            shape: BoxShape.circle,
          ),
          child: Image.asset(imagePath, height: 32, width: 32),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
