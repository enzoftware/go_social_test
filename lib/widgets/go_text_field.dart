import 'package:flutter/material.dart';

enum GoInputType {
  text,
  date,
  numeric,
}

class GoTextField extends StatelessWidget {
  final String labelText;
  final Widget suffix;
  final bool enabled;
  final TextEditingController controller;
  final String Function(String) validator;
  final int maxLines;
  final GoInputType type;
  final double borderRadius;
  final bool autofocus;
  final VoidCallback onTap;
  final bool readOnly;

  const GoTextField({
    Key key,
    this.labelText,
    this.suffix = const SizedBox(),
    this.enabled = true,
    this.controller,
    this.validator,
    this.maxLines = 1,
    this.type = GoInputType.text,
    this.borderRadius = 8,
    this.autofocus,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autofocus: autofocus ?? false,
      keyboardType: chooseTextInput(),
      controller: controller,
      enabled: enabled,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        suffixIcon: suffix,
        labelText: labelText,
        focusColor: Theme.of(context).primaryColor,
        filled: true,
        labelStyle: TextStyle(
          color: enabled ? Colors.grey[800] : Colors.grey[200],
        ),
        errorStyle: const TextStyle(
          fontSize: 9,
        ),
        fillColor: enabled ? Colors.white : Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }

  TextInputType chooseTextInput() {
    switch (type) {
      case GoInputType.numeric:
        return TextInputType.number;
        break;
      case GoInputType.date:
        return TextInputType.datetime;
        break;
      default:
        return TextInputType.text;
    }
  }
}
