import 'package:flutter/material.dart';
import 'package:sample_bloc/presentation/app_scaffold.dart';
import 'package:sample_bloc/presentation/screen/login/login_argument.dart';
import 'package:sample_bloc/routes/app_navigate.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.argument});

  final LoginArgument? argument;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppbar: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(),
          const SizedBox(height: 20),
          TextField(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              return AppNavigate.instance.gotoApp();
            },
            child: Text("Login"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              return AppNavigate.instance.back(result: "Xin chao");
            },
            child: Text("Back: ${argument?.content ?? ''}"),
          ),
        ],
      ),
    );
  }
}
