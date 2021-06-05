import 'package:flutter/material.dart';
import 'package:paypal_app/src/utils/styles.dart';

class PaymentActionBox extends StatelessWidget {
  const PaymentActionBox({
    required this.label,
    required this.icon,
    this.onPressed,
    this.color = AppColors.deepBlue,
    required this.contentColor,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Color color;
  final Color contentColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 120,
        margin: EdgeInsets.only(top: 16, right: 16, bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: contentColor,
            ),
            Text(
              label,
              style: TextStyle(color: contentColor),
            )
          ],
        ),
      ),
    );
  }
}
