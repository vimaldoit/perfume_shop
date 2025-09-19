import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfume_shop/data/repositories/repository.dart';
import 'package:perfume_shop/services/secure_storage_service.dart';
import 'package:perfume_shop/ui/screens/home/home.dart';
import 'package:perfume_shop/ui/screens/home/home_bloc.dart';
import 'package:perfume_shop/ui/screens/home/home.dart';
import 'package:perfume_shop/ui/screens/login/login.dart';
import 'package:perfume_shop/ui/screens/login/login_bloc.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkuser();
  }

  Future<void> checkuser() async {
    await Future.delayed(const Duration(seconds: 2));

    final SecureStorageService _storage = SecureStorageService();
    String? authToken = await _storage.getToken();
    if (authToken == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => LoginBloc(Repository()),
                child: LoginScreen(),
              ),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        HomeBloc(Repository())..add(FetchHomeDataEvent()),
                child: HomeScreen(),
              ),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttonColor,
      body: Center(
        child: Text(
          "PERFUME SHOP",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ),
      ),
    );
  }
}
