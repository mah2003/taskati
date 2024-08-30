import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/Text_style.dart';
import 'package:taskati/core/utils/colors.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: Appcolor.blue),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Name of task",
                    style: getBodyTextStyle(
                        color: Appcolor.blue, FontWeight: FontWeight.w600)),
                const Gap(5),
                Row(
                  children: [
                    Icon(Icons.alarm_rounded),
                    Text(
                      "  start __end",
                      style: getSmallTextStyle(),
                    ),
                  ],
                ),
                const Gap(5),
                Text("notee",
                    style: getBodyTextStyle(
                      color: Appcolor.white,
                    )),
              ],
            ),
          ),
          Container(
            width: 0.6,
            height: 60,
            color: Appcolor.white,
          ),
          Gap(10),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              "TODO",
              style: getHeadLineTextStyle(fontsize: 32, color: Appcolor.white),
            ),
          ),
        ],
      ),
    );
  }
}
