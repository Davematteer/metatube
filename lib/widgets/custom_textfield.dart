// ignore_for_file: prefer_const_constructors

import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "../utils/app_styles.dart";

class CustomTextfield extends StatefulWidget {
  final int maxLength;
  final int? maxLines;
  final String hintText;
  final TextEditingController controller;

  const CustomTextfield(
  {super.key, 
  required this.maxLength, 
  this.maxLines, 
  required this.hintText, 
  required this.controller,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {

  final _focusNode = FocusNode();
  
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void copyToClipboard(context, String text){
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      controller: widget.controller,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      keyboardType: TextInputType.multiline,
      cursorColor: AppTheme.accent,
      style: AppTheme.inputStyle,
      decoration: InputDecoration(
        hintStyle: AppTheme.hintStyle,
        hintText: widget.hintText,
        suffixIcon: _copyButton(context),
        focusedBorder: OutlineInputBorder(
          borderSide: 
          BorderSide(
            color: AppTheme.accent,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.medium,
          )
        ),
        counterStyle: AppTheme.counterStyle,
      ),
    );
  }

  IconButton _copyButton(BuildContext context){
    return IconButton(
      onPressed: widget.controller.text.isNotEmpty ? 
      () => copyToClipboard(context,widget.controller.text):null, 
      splashRadius: 20,
      splashColor: AppTheme.accent,
      disabledColor: AppTheme.medium,
      icon: Icon(Icons.content_copy_rounded),
      color: AppTheme.accent,
      );
  }
}