import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_ui/data/API%20helper/api_helper.dart';
import 'package:wallpaper_ui/data/repository/wallpaper_repo.dart';
import 'package:wallpaper_ui/screens/home/cubit/trending_wal_cubit.dart';
import 'package:wallpaper_ui/screens/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => TrendingWalCubit(
                        wallPaperRepository:
                            WallPaperRepository(apiHelper: ApiHelper())),
                    child: HomePage(),
                  )));
    });

    _animationController = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();


    Timer(Duration(milliseconds: 400), (){
      isVisible = true;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 900),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/wallpaper_icon.png",
              width: 50,
              height: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Swipescape",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      ),
    ));
  }
}
