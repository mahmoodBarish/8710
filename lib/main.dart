import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/detail_item_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/detail_item',
  routes: [
    GoRoute(
      path: '/detail_item',
      builder: (context, state) => const DetailItemScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter GoRouter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
