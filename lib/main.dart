import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfume_shop/data/repositories/repository.dart';
import 'package:perfume_shop/ui/screens/login/login.dart';
import 'package:perfume_shop/ui/screens/login/login_bloc.dart';
import 'package:perfume_shop/ui/screens/splash_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Builder(
      builder: (context) {
        return DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => MyApp(), // Wrap your app
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Perfume Shop',
          theme: ThemeData(
            fontFamily: 'Hellix',

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          ),
          home: SplashScreen(),
          // BlocProvider(
          //   create: (context) => LoginBloc(Repository()),
          //   child: LoginScreen(),
          // ),
        );
      },
    );
  }
}
