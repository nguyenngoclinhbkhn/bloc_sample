import 'package:flutter/material.dart';
import 'package:sample_bloc/presentation/screen/login/login_argument.dart';
import 'package:sample_bloc/routes/app_navigate.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            final a = await AppNavigate.instance.gotoLogin(
              LoginArgument("Xin chao, tôi là splash"),
            );
            debugPrint("---- back from login = $a");
          },
          child: const Text("Navigate to login"),
        ),
      ],
    );
  }
}
