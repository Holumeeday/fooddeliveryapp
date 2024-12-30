import 'package:asap/features/auth/screen/auth_screen.dart';
import 'package:asap/features/auth/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedInRoute =
    RouteMap(routes: {'/': (_) => const MaterialPage(child: MainPage())});

final loggedOut =
    RouteMap(routes: {'/': (_) => const MaterialPage(child: AuthScreen())});
