import 'package:flutter/material.dart';
import 'package:testapp/app/app_base.dart';
import 'package:testapp/common/constants/env.dart';
import 'package:testapp/common/utils/size_config.dart';
import 'package:testapp/common/widgets/global_error_widget.dart';
import 'package:testapp/common/widgets/wrapper/multi_bloc_wrapper.dart';
import 'package:testapp/common/widgets/wrapper/multi_repository_wrapper.dart';

class AppProd extends StatelessWidget {
  final Env env;
  const AppProd({super.key, required this.env});

  @override
  Widget build(BuildContext context) {
    SizeUtils.init(context: context);

    return MultiRepositoryWrapper(
      env: env,
      child: MultiBlocWrapper(
        env: env,
        child: BaseApp(
          builder: (context, Widget? widget) {
            setErrorBuilder(context);
            return widget!;
          },
        ),
      ),
    );
  }
}
