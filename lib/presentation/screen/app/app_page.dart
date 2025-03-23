import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/presentation/screen/app/app_bloc.dart';
import 'package:sample_bloc/routes/app_navigate.dart';
import 'package:sample_bloc/routes/app_route.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: NestedNavigate.instance.key,
        initialRoute: AppRoute.menu1.rawValue,
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => AppBloc(),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (ctx, state) {
            return BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: (index) {
                ctx.read<AppBloc>().changeTab(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Menu1"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Setting",
                ),
              ],
            );
          },
        ),
      ),
    );
  }

}
