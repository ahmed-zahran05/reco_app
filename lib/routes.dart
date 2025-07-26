import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/screens/login.dart';
import 'features/menu/presentation/bloc/menu_cubit.dart';
import 'features/menu/presentation/screens/menu.dart';

class AppRoutes {
  static const String login = '/login';
  static const String menu = '/menu';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case menu:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MenuCubit(),
            child: const MenuScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No route defined"))),
        );
    }
  }
}
