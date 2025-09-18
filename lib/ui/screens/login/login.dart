import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfume_shop/data/repositories/repository.dart';
import 'package:perfume_shop/ui/common_widgets/app_loader.dart';
import 'package:perfume_shop/ui/screens/home/home.dart';
import 'package:perfume_shop/ui/screens/home/home_bloc.dart';
import 'package:perfume_shop/ui/screens/login/login_bloc.dart';
import 'package:perfume_shop/utils/app_validations.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            AppValidations.showSnackBar(context, state.error);
          }
          if (state is LoginSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder:
                    (_) => BlocProvider(
                      create:
                          (context) =>
                              HomeBloc(Repository())..add(FetchHomeDataEvent()),
                      child: HomeScreen(),
                    ),
              ),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoader) {
            return AppLoader();
          }
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                        LoginbuttonPressed(
                          deviceToken: "test_token",
                          deviceType: "1",
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColors.buttonColor,
                      foregroundColor: AppColors.buttonTextcolor,
                    ),
                    child: Text(
                      "Guest Login",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
