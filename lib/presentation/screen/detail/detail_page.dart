import 'package:flutter/material.dart';
import 'package:sample_bloc/presentation/app_scaffold.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Detail page",
      body: Center(child: Text("Detail page")),
    );
  }
}
