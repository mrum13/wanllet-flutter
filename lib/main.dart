import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanllet/cubit/navbar_cubit.dart';
import 'package:wanllet/pages/main_page.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarBrightness: Brightness.light
  //   )
  // );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => NavbarCubit())],
      child: MaterialApp(
        routes: {"/": (context) => const MainPage()},
        initialRoute: "/",
      ),
    );
  }
}
