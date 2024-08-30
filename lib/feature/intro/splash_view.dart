import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/Services/local_storsge.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/Text_style.dart';
import 'package:taskati/feature/home/HomeView.dart';
import 'package:taskati/feature/upload/uploadveiw.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      pushReplacement(
          context,
          AppLocalStorage.getCasheDeta(AppLocalStorage.KeyIsUpLoad)
              ? const HomeVeiw()
              : const UploadVeiwState());
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/logo.json', width: 250, height: 200),
            Text("Taskati", style: getHeadLineTextStyle()),
            const Gap(10),
            Text(
              "It's Time to be organized",
              style: getSmallTextStyle(),
            ),
          ],
        ),
      ),
    ));
  }
}
