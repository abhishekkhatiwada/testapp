import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testapp/app/app_colors.dart';
import 'package:testapp/common/utils/size_config.dart';
import 'package:testapp/common/widgets/page_wrapper.dart';
import 'package:testapp/common/widgets/title_description_widget.dart';
import 'package:testapp/features/authentication/ui/screens/email_login.dart';
import 'package:testapp/features/authentication/ui/screens/phone_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List tabText = ['Email', 'Phone Number'];
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return PageWrapper(
      showBackButton: true,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleDescriptionWidget(
            title: "auth.login".tr(),
            description: "Let’s login with your account !",
            buttomGap: 21.hp,
          ),
          TabBar(
            labelPadding: EdgeInsets.zero,
            indicatorWeight: 4,
            dividerHeight: 2,
            indicatorPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: AppColors.gray.withAlpha(60),
            controller: _tabController,
            tabs: List.generate(tabText.length, (index) {
              return Container(
                constraints: BoxConstraints(minHeight: 30, maxHeight: 30),
                alignment: Alignment.center,
                child: Tab(text: tabText[index]),
              );
            }),
            labelStyle: textTheme.bodyLarge,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [EmailLogin(), PhoneLogin()],
            ),
          ),
        ],
      ),
    );
  }
}
