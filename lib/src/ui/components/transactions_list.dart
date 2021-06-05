import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paypal_app/src/data/transaction.dart';
import 'package:paypal_app/src/utils/constants.dart';
import 'package:paypal_app/src/utils/styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class TransactionsList extends StatelessWidget {
  const TransactionsList({
    Key? key,
    required this.transactionList,
  }) : super(key: key);

  final List<Transaction> transactionList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        var transactions = transactionList.reversed.toList();
        var transaction = transactions[index];
        return SizedBox(
          height: 81,
          child: Column(
            children: [
              Material(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.white,
                child: ListTile(
                  tileColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: Text(transaction.to.name),
                  leading: transaction.to.profilePicURL == null
                      ? CircleAvatar(
                          backgroundColor: AppColors.light,
                          child: Text(
                            getInitials(string: transaction.to.name),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.dark),
                          ),
                        )
                      : Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.light,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(500),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: transaction.to.profilePicURL!,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Text(
                                getInitials(string: transaction.to.name),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.dark),
                              ),
                            ),
                          ),
                        ),
                  subtitle: Text(
                      '${timeago.format(DateTime.now().subtract(DateTime.now().difference(transaction.transactionDate)))}'),
                  trailing: Text(
                    '\$ ${transaction.amount}',
                    style: TextStyle(color: AppColors.green),
                  ),
                ),
              ),
              SizedBox(height: 9),
            ],
          ),
        );
      }, childCount: transactionList.length),
    );
  }
}
