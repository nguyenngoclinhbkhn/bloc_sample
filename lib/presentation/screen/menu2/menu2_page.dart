import 'package:flutter/material.dart';
import 'package:sample_bloc/presentation/app_scaffold.dart';
import 'package:sample_bloc/data/local/sqlite/entity/user_entity.dart';
import 'package:sample_bloc/data/local/sqlite/sqflite_utils.dart';
import 'package:sample_bloc/routes/app_navigate.dart';
import 'package:sample_bloc/widget/loading/loading.dart';

class Menu2Page extends StatelessWidget {
  const Menu2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Widget test",
      backgroundColor: Colors.green,
      back: false,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Loading.show();
                  Future.delayed(Duration(seconds: 3), () {
                    Loading.dismiss();
                  });
                },
                child: const Text("Show loading"),
              ),
              ElevatedButton(
                onPressed: () async {
                  AppNavigate.instance.showAppDialog(
                    title: 'Title',
                    message: 'Message',
                    positiveText: 'Positive',
                    negativeText: 'Negative',
                    onNegativeClicked: () {},
                    onPositiveClicked: () {
                      debugPrint('---- clicked');
                      AppNavigate.instance.back();
                    },
                  );
                },
                child: const Text("Show dialog"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await SqfliteUtils.instance.insertUser(
                    UserEntity(userName: "UserName", pass: "Pass"),
                  );
                  final data = await SqfliteUtils.instance.getAllUser();
                  AppNavigate.instance.showAppDialog(
                    title: 'Database',
                    message: data.map((e) => e.toString()).join('\n'),
                    positiveText: 'Positive',
                    negativeText: 'Negative',
                    onNegativeClicked: () {},
                    onPositiveClicked: () {
                      debugPrint('---- clicked');
                      AppNavigate.instance.back();
                    },
                  );
                },
                child: const Text("Test database"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
