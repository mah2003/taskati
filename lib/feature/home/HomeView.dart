import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/feature/home/Widgets/Herder.dart';
import 'package:taskati/feature/home/Widgets/Home_Header.dart';
import 'package:taskati/feature/home/Widgets/Task_item_widget.dart';

class HomeVeiw extends StatefulWidget {
  const HomeVeiw({super.key});

  @override
  State<HomeVeiw> createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeaderWidget(),
                Gap(20),
                AddTask(),
                const Gap(20),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TaskItemWidget();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
