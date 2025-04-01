import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/common/constants/custom_locale.dart';
import 'package:testapp/common/cubit/theme_cubit.dart';
import 'package:testapp/common/widgets/bottom_sheet/parking_detail_buttomsheet.dart';
import 'package:testapp/common/widgets/page_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                child: Text('changetheme'.tr()),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showParkingDetailButtomSheet(
                    title: "Test",
                    context: context,
                    endPoint: "",
                    onCallBack: () {},
                  );
                },
                child: Text('next'.tr()),
              ),
            ),

            IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                Locale newLocale =
                    context.locale == CustomLocale.english
                        ? CustomLocale.nepali
                        : CustomLocale.english;

                if (context.supportedLocales.contains(newLocale)) {
                  context.setLocale(newLocale);
                } else {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
