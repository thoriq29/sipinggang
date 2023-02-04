import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final Widget? prefix;
  final String? hintText;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  InputText({
    this.prefix,
    this.hintText,
    this.textEditingController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: this.textEditingController,
        validator: this.validator,
        decoration: InputDecoration(
          hintText: this.hintText ?? "",
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: prefix,
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          border: InputBorder.none,
          isDense: true,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
