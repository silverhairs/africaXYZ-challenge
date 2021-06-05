import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paypal_app/src/logic/providers.dart';
import 'package:paypal_app/src/ui/transaction_screen.dart';
import 'package:paypal_app/src/utils/styles.dart';

import 'components/action_card.dart';
import 'components/header.dart';
import 'components/transactions_list.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionList = useProvider(Providers.transactionsListProvider);
    final balance = useProvider(Providers.balanceProvier);

    return Container(
      width: double.infinity,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            delegate: _HeaderDelegate(child: Header(balance: balance)),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 16.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: PaymentActionBox(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => TransactionScreen(),
                        ),
                      ),
                      label: 'Send\nMoney',
                      icon: FlutterRemix.upload_2_line,
                      contentColor: AppColors.white,
                    ),
                  ),
                  Expanded(
                    child: PaymentActionBox(
                      onPressed: () => _unavailableFeatDialog(context),
                      label: 'Request\nPayment',
                      icon: FlutterRemix.download_2_line,
                      color: AppColors.white,
                      contentColor: AppColors.deepBlue,
                    ),
                  ),
                  InkWell(
                    onTap: () => _unavailableFeatDialog(context),
                    child: Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 120,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Icon(FlutterRemix.more_2_fill),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Activity',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: AppColors.black),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(color: AppColors.black.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            sliver: transactionList.isEmpty
                ? SliverToBoxAdapter(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Text(
                        'No transaction yet!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : TransactionsList(transactionList: transactionList),
          )
        ],
      ),
    );
  }

  void _unavailableFeatDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Oops!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text('That Feature is not available yet'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            )
          ],
        ),
      );
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  const _HeaderDelegate({
    required this.child,
    this.minHeight = 200,
    this.maxHeight = 250,
  });
  final double maxHeight;
  final double minHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}
