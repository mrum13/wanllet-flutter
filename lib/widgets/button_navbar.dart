import 'package:flutter/material.dart';
import 'package:wanllet/common/app_colors.dart';
import 'package:wanllet/cubit/navbar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonNavbar extends StatelessWidget {
  final String title;
  final String imagePath;
  final int index;

  const ButtonNavbar({
    super.key,
    required this.imagePath,
    required this.title,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    int indexState = context.read<NavbarCubit>().state;
    return InkWell(
      onTap: () => context.read<NavbarCubit>().setPage(index),
      child: SizedBox(
        height: 50,
        width: 50,
        child: Column(
          children: [
            Image.asset(imagePath, height: 24, width: 24,),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(fontSize: 10, color: whiteColor)),
            const SizedBox(height: 4),
            index == indexState
            ? Container(width: 21, height: 1, color: whiteColor)
            : const SizedBox()
          ],
        ),
      ),
    );
  }
}
