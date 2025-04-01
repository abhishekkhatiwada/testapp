import 'package:flutter/material.dart';
import 'package:testapp/app/app_base.dart';
import 'package:testapp/common/constants/env.dart';
import 'package:testapp/common/utils/size_config.dart';
import 'package:testapp/common/widgets/wrapper/multi_bloc_wrapper.dart';
import 'package:testapp/common/widgets/wrapper/multi_repository_wrapper.dart';

class AppDev extends StatefulWidget {
  final Env env;
  const AppDev({super.key, required this.env});

  @override
  State<AppDev> createState() => _AppDevState();
}

class _AppDevState extends State<AppDev> {
  @override
  Widget build(BuildContext context) {
    SizeUtils.init(context: context);
    return MultiRepositoryWrapper(
      env: widget.env,
      child: MultiBlocWrapper(env: widget.env, child: BaseApp()),
    );
  }
}
