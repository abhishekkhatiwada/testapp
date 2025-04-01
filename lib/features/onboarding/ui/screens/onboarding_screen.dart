import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testapp/app/app_colors.dart';
import 'package:testapp/common/constants/image_constant.dart';
import 'package:testapp/common/utils/navigation_service.dart';
import 'package:testapp/common/utils/size_config.dart';
import 'package:testapp/common/widgets/%20buttons/custom_outline_button.dart';
import 'package:testapp/common/widgets/%20buttons/custom_rounded_button.dart';
import 'package:testapp/common/widgets/page_wrapper.dart';
import 'package:testapp/features/authentication/ui/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> images = [onboardingImageOne, onboardingImageTwo];

  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    _startAutoPageMove();
  }

  void _startAutoPageMove() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return PageWrapper(
      showAppBar: false,
      padding: EdgeInsets.zero,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: const Alignment(0.0, 0.9),
                    begin: const Alignment(0.0, -0.9),
                    colors: <Color>[
                      Colors.white.withValues(alpha: 0.3),
                      Colors.black.withValues(alpha: 0.4),
                      Colors.black.withValues(alpha: 0.4),
                      Colors.black.withValues(alpha: 0.5),
                      Colors.black.withValues(alpha: 0.5),
                      Colors.black.withValues(alpha: 0.6),
                      Colors.black.withValues(alpha: 0.7),
                      Colors.black.withValues(alpha: 1),
                      Colors.black.withValues(alpha: 1),
                      Colors.black.withValues(alpha: 1),
                    ],
                  ),
                  image: DecorationImage(
                    opacity: 0.5,
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 50,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "onboardingtitle".tr(),
                  style: textTheme.displayLarge!.copyWith(color: Colors.white),
                ),
                SizedBox(height: 8.hp),
                Text(
                  "onboardingdescription".tr(),
                  style: textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
                SizedBox(height: 8.hp),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(images.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 5,
                      width: index == _currentPage ? 5 : 35,
                      decoration: BoxDecoration(
                        color:
                            index == _currentPage
                                ? Colors.white
                                : AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 40.hp),

                Row(
                  children: [
                    Expanded(
                      child: CustomRoundedButton(
                        title: "auth.login".tr(),
                        onPressed: () async {
                          NavigationService.push(target: LoginScreen());
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomOutlineButton(
                        borderColor: AppColors.white,
                        title: "auth.signup".tr(),
                        textColor: AppColors.white,
                        onPressed: () async {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
