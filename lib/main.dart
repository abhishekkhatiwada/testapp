import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testapp/app/app_prod.dart';
import 'package:testapp/common/constants/env.dart';
import 'package:testapp/common/utils/custom_log.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () {
      runApp(AppProd(env: EnvValue.production));
    },
    (e, s) {
      CustomLog.error(e);
      CustomLog.action(s);
    },
  );
}
