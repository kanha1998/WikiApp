import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wiki/view/SearchPage/search_page.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SearchPageView();
      },
      routes: <RouteBase>[
        /*
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },




        ),


         */
      ],
    ),
  ],
);
