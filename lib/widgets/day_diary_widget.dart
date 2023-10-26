//가계부 상세내용 보여주는 위젯

import 'package:abc_money_diary/screens/diary_directory/diary_screen.dart';
import 'package:flutter/material.dart';

import '../models/diary_model.dart';
import 'day_diary_detail_widget.dart';

class DayDiaryWidget extends StatefulWidget {
  final Diary diary;

  const DayDiaryWidget({super.key, required this.diary});

  @override
  State<DayDiaryWidget> createState() => _DayDiaryWidgetState();
}

class _DayDiaryWidgetState extends State<DayDiaryWidget> {
  void update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //가계부 목록 클릭시 상세내용 보여주는 위젯
      onTap: () async {
        showDialog(
          context: context,
          barrierColor: Colors.black38,
          builder: (context) {
            return DayDiaryDetailWidget(diary: widget.diary);
          },
        );
        update();
      },

      //가계부 목록들
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          //가계부 테두리랑 뒤에 그림자 효과 등등
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.orange,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurStyle: BlurStyle.outer,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              //날짜 및 c항목 금액 표시하는 곳
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.diary.date!,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Yeongdeok-Sea",
                    ),
                  ),
                  if (widget.diary.type == 'A')
                    Text('C항목 ￦ 0',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Yeongdeok-Sea",
                        )),
                  if (widget.diary.type == 'B')
                    Text('C항목 ￦ 0',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Yeongdeok-Sea",
                        )),
                  if (widget.diary.type == 'C')
                    Text('C항목 ￦ ${widget.diary.money}',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Yeongdeok-Sea",
                        )),

                ],
              ),

              //경계선
              Divider(
                thickness: 2,
                height: 5,
                color: Colors.orange,
              ),

              //각 지출들을 날짜 별로 출력하는 곳
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.diary.type!),
                    Text(widget.diary.time!),
                    Text(widget.diary.category!),
                    Text('￦ ${widget.diary.money!}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}