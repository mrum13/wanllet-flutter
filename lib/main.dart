import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanllet/cubit/navbar_cubit.dart';
import 'package:wanllet/pages/main_page.dart';
import 'package:wanllet/pages/search_page.dart';
import 'package:wanllet/pages/send_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => NavbarCubit())],
      child: MaterialApp(
        routes: {
          "/": (context) => const MainPage(),
          "/search": (context) => const SearchPage(),
          "/send": (context) => const SendPage(),
        },
        initialRoute: "/",
      ),
    );
  }
}
