import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finfly/config/extensions/textfield_extensions.dart';

class GlobalTextField extends StatelessWidget {
  final String hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final Widget? suffix;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onTap;
  final bool obsecure;
  final TextInputType inputType;
  final List<TextInputFormatter>? textInputFormatters;
  final TextInputAction textInputAction;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? suffixColor;
  final int? maxLines;
  final Color? fillColor;
  const GlobalTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.onTap,
    this.suffix,
    this.onSuffixTap,
    this.fillColor,
    this.textInputFormatters,
    this.suffixIcon,
    this.maxLines,
    this.obsecure = false,
    this.inputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onSaved,
    this.validator,
    this.controller,
    this.suffixColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        inputFormatters: textInputFormatters,
        controller: controller,
        onTap: onTap,
        readOnly: onTap != null,
        obscureText: obsecure,
        keyboardType: inputType,
        textInputAction: textInputAction,
        onSaved: onSaved,
        validator: validator,
        maxLines: obsecure ? 1 : maxLines,
        decoration: CustomInputDecoration.decorate(
          context,
          hintText: hintText,
          prefixIcon: prefixIcon,
          onSuffixTap: onSuffixTap,
          suffix: suffix,
          suffixIcon: suffixIcon,
          suffixColor: suffixColor,
          fillColor: fillColor,
        ),
      ),
    );
  }
}
