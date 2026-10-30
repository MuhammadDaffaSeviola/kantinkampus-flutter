import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/menu.dart';
import '../../presentation/views/home_view.dart';
import '../../presentation/views/login_page.dart';
import '../../presentation/views/menu_detail_view.dart';
import '../../presentation/views/order_page.dart';
import '../../presentation/views/order_success_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    // =========================
    // LOGIN
    // =========================
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginView();
      },
    ),

    // =========================
    // HOME
    // =========================
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const HomeView();
      },
    ),

    // =========================
    // DETAIL MENU
    // =========================
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final extra = state.extra;

        if (extra is! Menu) {
          return const Scaffold(
            body: Center(
              child: Text('Data menu tidak ditemukan'),
            ),
          );
        }

        return MenuDetailView(menu: extra);
      },
    ),


    GoRoute(
  path: '/order',
  builder: (context, state) {
    return const OrderView();
  },
),

    // =========================
    // ORDER SUCCESS
    // =========================
    GoRoute(
      path: '/success',
      builder: (context, state) {
        return const OrderSuccessView();
      },
    ),
  ],
);