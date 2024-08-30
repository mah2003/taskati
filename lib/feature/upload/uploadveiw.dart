import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/Widgets/Custom_Button.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/Text_style.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/feature/home/HomeView.dart';

class UploadVeiwState extends StatefulWidget {
  const UploadVeiwState({super.key});

  @override
  State<UploadVeiwState> createState() => _UploadVeiwStateState();
}

class _UploadVeiwStateState extends State<UploadVeiwState> {
  String? imagePath;
  String name = ' ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.black,
      appBar: AppBar(
        backgroundColor: Appcolor.black,
        actions: [
          TextButton(
            onPressed: () {
              if (name.isNotEmpty && imagePath != null) {
                var box = Hive.box('userBox');
                box.put('image', imagePath);
                box.put('name', name);
                box.put('Isuploaded', true);
                //navigation
                pushReplacement(context, HomeVeiw());
              } else if (name.isNotEmpty && imagePath == null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: (Text("image can't be empty")),
                  backgroundColor: Appcolor.red,
                ));
              } else if (name.isEmpty && imagePath != null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: (Text("Name can't be empty")),
                  backgroundColor: Appcolor.red,
                ));
              } else if (name.isEmpty && imagePath == null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: (Text("Name and image can't be empty")),
                  backgroundColor: Appcolor.red,
                ));
              }
            },
            child: Text(
              "Done",
              style: getBodyTextStyle(color: Appcolor.blue),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: (imagePath != null)
                      ? FileImage(File(imagePath ?? ' '))
                      : AssetImage("assets/images/Person.webp"),
                ),
                Gap(20),
                CustomButton(
                  text: "Upload From Camera",
                  onTap: () {
                    PickImage(IsFromCamera: true);
                  },
                  textstyle: getBodyTextStyle(),
                ),
                Gap(10),
                CustomButton(
                  text: "Upload From Gallery",
                  onTap: () {
                    PickImage(IsFromCamera: false);
                  },
                  textstyle: getBodyTextStyle(),
                ),
                Gap(15),
                Divider(color: Appcolor.blue),
                Gap(15),
                TextFormField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Write Your Name ..",
                    hintStyle: getSmallTextStyle(color: Appcolor.blue),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  PickImage({bool IsFromCamera = true}) {
    ImagePicker()
        .pickImage(
            source: IsFromCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          imagePath = value.path;
        });
      }
    });
  }
}
