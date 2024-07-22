import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin FormMixins {
  Widget customTextFormField(
    BuildContext context, {
    Function()? onTap,
    bool readOnly = false,
    bool? enabled,
    String? hintText,
    String? labelText,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    Color? borderColor,
    double borderRadius = 0,
    Color? fillColor,
    EdgeInsetsGeometry? contentPadding,
    bool? isDense,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? initialValue,
    int maxLines = 1,
    bool obscureText = false,
    TextEditingController? controller,
    AutovalidateMode? autovalidateMode,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    Function(String)? onFieldSubmitted,
    Function(String)? onChanged,
  }) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      enabled: enabled,
      controller: controller,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? const Color(0xffEBEBEB)),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? const Color(0xffEBEBEB)),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
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
        labelStyle: labelStyle,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        isDense: isDense,
      ),
      obscureText: obscureText,
      initialValue: initialValue,
      autovalidateMode: autovalidateMode,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }

  Widget customDropdownButtonFormField<T>(
    BuildContext context, {
    T? value,
    List<DropdownMenuItem<T>>? items,
    String? hintText,
    String? labelText,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    Color? borderColor,
    double borderRadius = 0,
    Color? fillColor,
    Widget? prefixIcon,
    Widget? suffixIcon,
    EdgeInsetsGeometry? contentPadding,
    Function()? onTap,
    Function(dynamic)? onChanged,
    AutovalidateMode? autovalidateMode,
    String? Function(dynamic)? validator,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onTap: onTap,
      onChanged: onChanged,
      autovalidateMode: autovalidateMode,
      validator: validator,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? const Color(0xffEBEBEB)),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? const Color(0xffEBEBEB)),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
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
        labelStyle: labelStyle,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
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
    double? width,
    double? height,
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
        width: width,
        height: height,
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
