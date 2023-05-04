import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wiki/view/DetailsPage/details_page.dart';
import 'package:wiki/view/HomePage/home_page.dart';
import 'package:wiki/view/SearchPage/search_page.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[

    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      }),
    GoRoute(
        path: '/search',
        builder: (BuildContext context, GoRouterState state) {
          return const SearchPageView();
        }),
    GoRoute(
        path: '/details',
        builder: (BuildContext context, GoRouterState state) {
          return DetailsPage();
        }),

      ],
    );
