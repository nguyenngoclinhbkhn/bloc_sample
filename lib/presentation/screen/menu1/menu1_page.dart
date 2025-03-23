import 'package:flutter/material.dart';
import 'package:sample_bloc/app_scaffold.dart';
import 'package:sample_bloc/routes/app_navigate.dart';

class Menu1Page extends StatelessWidget {
  const Menu1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      back: false,
      title: "Menu1",
      body: SizedBox.expand(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                AppNavigate.instance.gotoDetail();
              },
              child: Text("Goto detail"),
            ),
          ],
        ),
      ),
    );
  }
}
