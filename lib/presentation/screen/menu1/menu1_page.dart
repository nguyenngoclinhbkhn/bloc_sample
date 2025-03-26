import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/presentation/app_scaffold.dart';
import 'package:sample_bloc/presentation/screen/menu1/menu1_bloc.dart';
import 'package:sample_bloc/routes/app_navigate.dart';

class Menu1Page extends StatelessWidget {
  const Menu1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      back: false,
      title: "Menu1",
      body: BlocProvider(
        create: (context) =>
        Menu1Bloc()
          ..add(LoadDataEvent()),
        child: BlocBuilder<Menu1Bloc, DataState>(builder: (ctx, state) =>
            SizedBox.expand(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      AppNavigate.instance.gotoDetail();
                    },
              child: Text("Goto detail"),
            ),
                  if (state is DataStateLoaded)
                    Expanded(
                      child: ListView.builder(itemBuilder: (ctx, index) {
                        final model = state.response.posts[index];
                        return Column(children: [
                          Text(model.id.toString()),
                          Text(model.userId.toString()),
                          Text(model.title.toString()),
                          Text(model.body.toString()),
                        ],);
                      },
                        shrinkWrap: true,
                        itemCount: state.response.posts.length,),
                    ) else
                    SizedBox.shrink()
                ],
              ),
            )),
      ),
    );
  }
}
