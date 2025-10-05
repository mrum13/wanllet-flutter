import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanllet/common/app_colors.dart';
import 'package:wanllet/common/image_resources.dart';
import 'package:wanllet/cubit/navbar_cubit.dart';
import 'package:wanllet/pages/home_page.dart';
import 'package:wanllet/widgets/button_navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const Center(child: Text("Statistic Page"));
        case 2:
          return const Center(child: Text("Wallet Page"));
        case 3:
          return const Center(child: Text("Setting"));
        default:
          return const HomePage();
      }
    }

    return BlocBuilder<NavbarCubit, int>(
      builder: (context, currentIndex) {
        return AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  background,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(children: [Expanded(child: buildContent(currentIndex))]),
                Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: Container(
                    height: 76,
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(navbar),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonNavbar(
                          imagePath: navbarHome,
                          title: "Home",
                          index: 0,
                        ),
                        ButtonNavbar(
                          imagePath: navbarChart,
                          title: "Statistic",
                          index: 1,
                        ),
                        ButtonNavbar(
                          imagePath: navbarWallet,
                          title: "Wallet",
                          index: 2,
                        ),
                        ButtonNavbar(
                          imagePath: navbarSetting,
                          title: "Setting",
                          index: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
