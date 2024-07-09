import 'package:flutter/material.dart';

mixin FormMixins {
  Widget customTextFormField(
    BuildContext context, {
    Function()? onTap,
    String? hintText,
    String? labelText,
    Color? borderColor,
    double borderRadius = 0,
    Color? fillColor,
    EdgeInsetsGeometry? contentPadding,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? initialValue,
    AutovalidateMode? autovalidateMode,
    String? Function(String?)? validator,
    Function(String)? onFieldSubmitted,
  }) {
    return TextFormField(
      onTap: onTap,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? const Color(0xffEBEBEB)),
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
      onFieldSubmitted: onFieldSubmitted,
    );
  }

  Widget customButton(
    BuildContext context, {
    Function()? onTap,
    Color? background,
    Color? borderColor,
    double? borderRadius,
    Widget? image,
    String? text,
    Color? textColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        decoration: BoxDecoration(
          color: background,
          border: Border.all(color: borderColor ?? const Color(0xffEBEBEB)),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null) ...[
              image,
            ],
            if (image != null && text != null) ...[
              const SizedBox(
                width: 10,
              )
            ],
            if (text != null) ...[
              Text(
                text.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: textColor),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
