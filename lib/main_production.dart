import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testapp/app/app_prod.dart';
import 'package:testapp/app/local_wrapper.dart';
import 'common/constants/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(LocalWrapper(child: AppProd(env: EnvValue.production)));
}
