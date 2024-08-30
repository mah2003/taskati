import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/Services/local_storsge.dart';
import 'package:taskati/core/Widgets/Custom_Button.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/utils/Text_style.dart';
import 'package:taskati/core/utils/colors.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  int colorindex = 0;
  String date = DateFormat.yMd().format(DateTime.now());
  String starttime = DateFormat("hh:mm a").format(DateTime.now());
  String endtime = DateFormat("hh:mm a").format(DateTime.now());
  var titleControlar = TextEditingController();
  var noteControlar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "title",
              style: getHeadLineTextStyle(),
            ),
            const Gap(5),
            TextFormField(
              controller: titleControlar,
              decoration: const InputDecoration(hintText: 'Add Flutter Task'),
            ),
            const Gap(10),
            Text(
              "Note",
              style: getBodyTextStyle(),
            ),
            const Gap(5),
            TextFormField(
              controller: noteControlar,
              decoration:
                  const InputDecoration(hintText: 'Add Flutter Task Note'),
            ),
            Text(
              "Date",
              style: getBodyTextStyle(),
            ),
            const Gap(10),
            TextFormField(
              readOnly: true,
              onTap: () {
                showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        lastDate: DateTime(2040))
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      date = DateFormat.yMd().format(value);
                    });
                  }
                });
              },
              decoration: InputDecoration(
                hintText: date,
                hintStyle: getBodyTextStyle(),
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: Appcolor.blue,
                ),
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "start time",
                  style: getBodyTextStyle(),
                )),
                const Gap(10),
                Expanded(
                    child: Text(
                  "end Time",
                  style: getBodyTextStyle(),
                )),
              ],
            ),
            const Gap(5),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            starttime = value.format(context);
                          });
                        }
                      });
                    },
                    decoration: InputDecoration(
                      hintText: starttime,
                      suffixIcon: Icon(
                        Icons.watch_later_outlined,
                        color: Appcolor.blue,
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        setState(() {
                          if (value != null) {
                            endtime = value.format(context);
                          }
                        });
                      });
                    },
                    decoration: InputDecoration(
                      hintText: endtime,
                      suffixIcon: Icon(
                        Icons.watch_later_outlined,
                        color: Appcolor.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(30),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              colorindex = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: (index == 0)
                                ? Appcolor.blue
                                : (index == 1)
                                    ? Appcolor.orange
                                    : Appcolor.red,
                            child: (colorindex == index)
                                ? const Icon(Icons.check, color: Colors.white)
                                : null,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                CustomButton(
                    width: 145,
                    text: "Create Task",
                    onTap: () {
                      String id = '$Title _ ${DateTime.now().toString()}';
                      AppLocalStorage.cachetask(
                          id,
                          TaskModel(
                              id: id,
                              title: titleControlar.text,
                              note: noteControlar.text,
                              date: date,
                              starttime: starttime,
                              endtime: endtime,
                              Color: colorindex,
                              IsCompleted: false));
                    },
                    textstyle: getBodyTextStyle(
                      color: Appcolor.white,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
