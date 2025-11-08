// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/root.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> fadeLogo;
  late Animation<Offset> slideLogo;

  late Animation<double> fadeImage;
  late Animation<Offset> slideImage;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );

    // Logo enters from the LEFT + fade
    fadeLogo = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    slideLogo =
        Tween<Offset>(
          begin: Offset(-0.3, 0), // from left
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.6, curve: Curves.easeOut),
          ),
        );

    // SPASH IMAGE enters from the BOTTOM with a delay (staggered)
    fadeImage = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    slideImage =
        Tween<Offset>(
          begin: Offset(0, 0.35), // from bottom
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.4, 1.0, curve: Curves.easeOut),
          ),
        );

    controller.forward();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => Root()),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(300),
            FadeTransition(
              opacity: fadeLogo,
              child: SlideTransition(
                position: slideLogo,
                child: SvgPicture.asset('assets/logo/logo.svg'),
              ),
            ),
            Spacer(),
            FadeTransition(
              opacity: fadeImage,
              child: SlideTransition(
                position: slideImage,
                child: Image.asset('assets/splash/splash.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
