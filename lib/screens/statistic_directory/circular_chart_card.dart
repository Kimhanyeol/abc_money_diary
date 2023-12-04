import 'package:flutter/material.dart';

import '../../repository/sql_diary_crud_repository.dart';
import '../../widgets/none_information_widget.dart';
import '../../widgets/pair.dart';
import 'circle_category_screen.dart';

class CircularChartCard extends StatefulWidget {
  final String diaryMonth;
  const CircularChartCard({super.key, required this.diaryMonth});

  @override
  State<CircularChartCard> createState() => _CircularChartCardState();
}

class _CircularChartCardState extends State<CircularChartCard> {

  List<Pair> categoryMoney = [];
  Map<String, String> categoryMap = {};

  Future<List<Pair>> _getTotalCategory(String month) async {
    List<Pair> newList = await SqlDiaryCrudRepository.getTotalCategory(month);
    categoryMoney = newList;
    return categoryMoney;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getTotalCategory(widget.diaryMonth),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return NoneInformationWidget();
          }
          return CircleCategoryScreen(
            categoryMap: categoryMap,
            categoryMoney: categoryMoney,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}