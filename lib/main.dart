import 'dart:io';

import 'package:biskota/cubit/auth_cubit.dart';
import 'package:biskota/cubit/page_cubit.dart';
import 'package:biskota/screens/pages/bonus_page.dart';
import 'package:biskota/screens/pages/get_started_page.dart';
import 'package:biskota/screens/pages/main_page.dart';
import 'package:biskota/screens/pages/sign_up_pages.dart';
import 'package:biskota/screens/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'AIzaSyADbagAiRBRhnVysyFhICWwRdrTnlT_av4',
          appId: ':44844995898:android:f139b41af1a6da36c52c03',
          messagingSenderId: '44844995898',
          projectId: 'biskota-12c7d',
        ))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'BISKOTA',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}
