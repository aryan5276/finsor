import 'package:flutter/material.dart';

class TextFieldWithOnlyHintText extends StatelessWidget {
  String hintText;
  bool? doneKeyDisplayed = false;
  bool? autofocus = false;
  Function(String) onSubmitted;
  TextEditingController? controller;
  TextStyle? hintstyle = TextStyle(
      color: Colors.black12.withOpacity(0.7), fontWeight: FontWeight.w600);
  TextFieldWithOnlyHintText(
      {required this.hintText,
      this.doneKeyDisplayed,
      this.autofocus,
      this.hintstyle,
      this.controller,
      required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: TextField(
        onSubmitted: this.onSubmitted,
        expands: true,
        maxLines: null,
        minLines: null,
        controller: this.controller,
        textInputAction: this.doneKeyDisplayed == true
            ? TextInputAction.done
            : TextInputAction.next,
        autofocus: this.autofocus == false ? false : true,
        // onEditingComplete: () {
        //   FocusScope.of(context).nextFocus();
        //   //context.nextEditableTextFocus();
        // },

        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintMaxLines: 2,
            hintStyle: this.hintstyle),
      ),
    );
  }
}
