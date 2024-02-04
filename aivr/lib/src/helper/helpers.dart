import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> delayedNavigationTo(BuildContext context, int seconds,
    int milliseconds, String routeName) async {
  try {
    debugPrint('test');
    Future.delayed(Duration(seconds: seconds, milliseconds: milliseconds));
    // ignore: use_build_context_synchronously
    GoRouter.of(context).goNamed(routeName);
  } on Exception catch (e) {
    rethrow;
  }
}
