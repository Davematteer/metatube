// ignore_for_file: prefer_const_constructors


import "package:flutter/material.dart";
import "package:metatube/services/file_service.dart";
import "package:metatube/utils/app_styles.dart";
import "package:metatube/widgets/custom_textfield.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  FileService fileService = FileService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
        child: Column(
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _mainButton(()=> null,"New File"),
                Row(
                  children: [
                    _actionButton(() => null, Icons.file_upload),
                    const SizedBox(width: 5,),
                    _actionButton(() => null, Icons.folder),
                  ],
                )
            ],),
            const SizedBox(height: 20),
            CustomTextfield
            (
              maxLength: 100, 
              maxLines: 3,
              hintText: "Enter Video Title", 
              controller: fileService.titleController
            ),
            const SizedBox(height: 40,),

            CustomTextfield
            (
              maxLength: 5000, 
              maxLines: 6,
              hintText: "Enter Video Description", 
              controller: fileService.descriptionController
            ),
            
            const SizedBox(height: 40,),

            CustomTextfield
            (
              maxLength: 500, 
              maxLines: 4,
              hintText: "Enter Video Title", 
              controller: fileService.tagsController
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                _mainButton(() => null, "Save Button"),
              ],
            )
        ],),
      )
    );
  }

  ElevatedButton _mainButton(Function()? onPressed, String text){
    return ElevatedButton(
      onPressed: onPressed, 
      child: Text(text),
      style: _buttonStyle(),
      );
  }

  IconButton _actionButton(Function()? onPressed,IconData icon){
    return IconButton(
      onPressed: onPressed, 
      // splashColor: AppTheme.accent,
      highlightColor: AppTheme.accent,
      splashRadius: 20,
      icon: Icon(
        icon,
        color: AppTheme.medium,
        )
      );
  }

  ButtonStyle _buttonStyle(){
    return ElevatedButton.styleFrom(
      backgroundColor: AppTheme.accent,
      foregroundColor: AppTheme.dark,
      disabledBackgroundColor: AppTheme.disabledBackgroundColor,
      disabledForegroundColor: AppTheme.disabledForegroundColor,
    );
  }
}

