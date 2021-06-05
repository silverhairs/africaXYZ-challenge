import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paypal_app/src/ui/login_screen.dart';
import 'package:paypal_app/src/utils/styles.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(Svg('assets/header-shape.svg'), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: AppColors.deepBlue,
        accentColor: AppColors.lightBlue,
        scaffoldBackgroundColor: AppColors.light,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.deepBlue, width: 2),
          ),
        ),
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: AppColors.light,
          elevation: 0,
          iconTheme: Theme.of(context).iconTheme.copyWith(
                color: AppColors.dark,
              ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
