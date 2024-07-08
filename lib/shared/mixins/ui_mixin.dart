import 'package:flutter/material.dart';

mixin UIMixins {
  Widget customTextFormField(
    BuildContext context, {
    String? hintText,
    String? labelText,
    Color borderColor = Colors.transparent,
    double borderRadius = 0,
    Color? fillColor,
    EdgeInsetsGeometry? contentPadding,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? initialValue,
    AutovalidateMode? autovalidateMode,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        fillColor: fillColor,
        filled: (fillColor != null) ? true : false,
        contentPadding: contentPadding,
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      initialValue: initialValue,
      autovalidateMode: autovalidateMode,
      validator: validator,
    );
  }
}
