import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/Services/local_storsge.dart';
import 'package:taskati/core/utils/Text_style.dart';
import 'package:taskati/core/utils/colors.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              AppLocalStorage.getCasheDeta(AppLocalStorage.KeyUserName),
              style: getHeadLineTextStyle(),
            ),
            Gap(6),
            Text(
              "Have a nice day",
              style: getBodyTextStyle(),
            ),
            Spacer(),
            CircleAvatar(
              radius: 32,
              backgroundColor: Appcolor.blue,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AppLocalStorage.getCasheDeta(
                            AppLocalStorage.keyUserImage) !=
                        null
                    ? FileImage(File(AppLocalStorage.getCasheDeta(
                        AppLocalStorage.keyUserImage)))
                    : AssetImage("assets/images/Person.webp"),
              ),
            )
          ],
        )
      ],
    );
  }
}
