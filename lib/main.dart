import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_ui/data/API%20helper/api_helper.dart';
import 'package:wallpaper_ui/data/repository/wallpaper_repo.dart';
import 'package:wallpaper_ui/screens/home/cubit/trending_wal_cubit.dart';
import 'package:wallpaper_ui/screens/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "poppins"),
      home: BlocProvider(
          create: (context) => TrendingWalCubit(
              wallPaperRepository:
                  WallPaperRepository(apiHelper: ApiHelper())),
        child: SplashScreen(),
      ),
    );
  }
}
