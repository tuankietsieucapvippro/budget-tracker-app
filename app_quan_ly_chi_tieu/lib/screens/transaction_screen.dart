import 'package:app_quan_ly_chi_tieu/widgets/tab_bar_view.dart';
import 'package:flutter/material.dart';
import '../widgets/category_list.dart';
import '../widgets/time_line_month.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Expansive")
      ),
      body: Column(
        children: [
          TimeLineMonth(
              onChanged: (String? value){
                if(value != null){
                  setState((){
                    monthYear = value;
                  });
                }
              }
          ),
          CategoryList(
              onChanged: (String? value) {
                if(value != null){
                  setState((){
                    category = value;

                  });
                }
              }),
          TypeTabBar(
              category: category,
              monthYear: monthYear)
        ],
      ),
    );
  }
}
