import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:intl/intl.dart';

import 'package:taskati/core/Widgets/Custom_Button.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/Text_style.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/feature/add_task/add_task_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: getHeadLineTextStyle(),
            ),
            Gap(6),
            Text(
              "Today",
              style: getBodyTextStyle(),
            ),
            CustomButton(
                width: 120,
                onTap: () {
                  push(context, AddTaskView());
                },
                text: " Add Task",
                textstyle: getBodyTextStyle()),
            Gap(20),
            DatePicker(
              height: 100,
              width: 80,
              DateTime.now(),
              initialSelectedDate: DateTime.now().subtract(Duration(days: 2)),
              selectionColor: Appcolor.blue,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
                /* setState(() {
            _selectedValue = date;
          });*/
              },
            ),
          ],
        )
      ],
    );
  }
}
