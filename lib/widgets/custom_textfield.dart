// ignore_for_file: prefer_const_constructors

import "dart:ui";

import "package:flutter/material.dart";

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
}