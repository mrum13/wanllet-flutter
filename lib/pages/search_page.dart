import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:wanllet/common/app_colors.dart';
import 'package:wanllet/common/image_resources.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  Random random = Random();
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  var historyData = [
    {
      'image_path': avatar3,
      'name': 'Ihsan Mustapa',
      'number': '+6285397875412',
    },
    {
      'image_path': avatar1,
      'name': 'Rihan Nugraha',
      'number': '+6285397875456',
    },
  ];

  List<Map<String, dynamic>> foundedData = [
    {
      'image_path': avatar1,
      'name': 'Ihsan Mustapa',
      'number': '+6285397875412',
    },
    {'image_path': avatar2, 'name': 'Nur Fadilah', 'number': '+6285397875434'},
    {
      'image_path': avatar3,
      'name': 'Rihan Nugraha',
      'number': '+6285397875456',
    },
    {'image_path': avatar4, 'name': 'Iyam', 'number': '+6285397875478'},
    {'image_path': avatar5, 'name': 'Amul', 'number': '+6285397875490'},
  ];

  @override
  void initState() {
    super.initState();

    // buat controller & animasi untuk setiap gambar
    _controllers = foundedData.map((_) {
      final duration = Duration(
        milliseconds: 500 + random.nextInt(4500),
      ); // 0.5–5 detik
      final controller = AnimationController(vsync: this, duration: duration);
      return controller;
    }).toList();

    _animations = _controllers
        .map((c) => CurvedAnimation(parent: c, curve: Curves.easeIn))
        .toList();

    // jalankan animasi dengan delay acak
    for (var i = 0; i < _controllers.length; i++) {
      final delay = Duration(
        milliseconds: random.nextInt(2000),
      ); // delay 0–2 detik
      Future.delayed(delay, () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              background2,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Image.asset(
              searchBackground,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(child: Lottie.asset(radar, fit: BoxFit.cover)),
            SafeArea(
              child: Stack(
                children: List.generate(foundedData.length, (index) {
                  final item = foundedData[index];
                  return Positioned(
                    top: random.nextInt(400).toDouble(),
                    left: random.nextInt(300).toDouble(),
                    child: FadeTransition(
                      opacity: _animations[index],
                      child: Draggable<Color>(
                        data: Colors.blue,
                        feedback: Stack(
                          children: [
                            Image.asset(
                              item['image_path'].toString(),
                              height: 100,
                              width: 100,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        childWhenDragging: SizedBox(),
                        child: Image.asset(
                          item['image_path'].toString(),
                          height: 80,
                          width: 80,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Center(
              child: DragTarget<Color>(
                onAccept: (data) {
                  Navigator.pushNamed(context, '/send');
                  // return true;
                  // Perform actions based on the dropped data
                },
                builder: (context, candidateData, rejectedData) {
                  return Container(width: 150, height: 150);
                },
              ),
            ),
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentGeometry.topLeft,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: const EdgeInsets.only(left: 16, top: 16),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 24,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    margin: const EdgeInsets.only(bottom: 16),
                    width: double.infinity,
                    height: 116,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            const SizedBox(width: 16),
                            InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/send'),
                              child: Container(
                                width: 300,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage(cardBackground),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      historyData[index]['image_path']
                                          .toString(),
                                      height: 50,
                                      width: 50,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            historyData[index]['name']
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: whiteColor,
                                            ),
                                          ),
                                          Text(
                                            historyData[index]['number']
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: textColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward_outlined,
                                        size: 24,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: historyData.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
