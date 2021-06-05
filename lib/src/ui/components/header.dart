import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:paypal_app/src/utils/styles.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.balance,
  }) : super(key: key);

  final double balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Svg('assets/header-shape.svg'),
          fit: BoxFit.cover,
        ),
        color: AppColors.deepBlue,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  FlutterRemix.paypal_fill,
                  color: AppColors.white,
                  size: 30,
                ),
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.teal,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage('assets/bob.png'),
                    ),
                  ),
                )
              ],
            ),
            Text(
              'Hello, Vadim',
              style: TextStyle(color: AppColors.white),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$ ${balance.toStringAsFixed(3)}',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: AppColors.white),
                ),
                Text(
                  'Your balance',
                  style: TextStyle(color: AppColors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
