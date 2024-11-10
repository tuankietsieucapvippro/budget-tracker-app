import 'package:app_quan_ly_chi_tieu/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class TypeTabBar extends StatelessWidget {
  const TypeTabBar({super.key, required this.category, required this.monthYear});
  final String category, monthYear;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(tabs: [
                  Tab(text: "Credit",),
                  Tab(text: "Debit",)
                ]),
                Expanded(child: TabBarView(
                  children: [
                    TransactionList(
                        category: category,
                        type: 'credit',
                        monthYear: monthYear
                    ),
                    TransactionList(
                        category: category,
                        type: 'debit',
                        monthYear: monthYear
                    ),
                  ],
                ))
              ],
            )));
  }
}
