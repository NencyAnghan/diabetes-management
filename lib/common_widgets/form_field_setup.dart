import 'package:diabetes_management/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFielsSetup extends StatelessWidget {
  FormFielsSetup(
      {Key key,
      this.controller,
      this.textInputType,
      this.hint,
      this.color,
      this.validator,
      this.enabled,
      this.maxLines,
      this.onChanged,
      this.onFieldSubmitted,
      this.textLength})
      : super(key: key);
  final String hint;
  final TextEditingController controller;
  final Color color;
  final FormFieldValidator<String> validator;
  final bool enabled;
  final int maxLines;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  final ValueChanged<String> onFieldSubmitted;
  final int textLength;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: new ThemeData(
        primaryColor: AppColors.backgroundColor9,
        primaryColorDark: AppColors.backgroundColor9,
      ),
      child: new TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(textLength ?? 50)],
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        enabled: enabled ?? true,
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.textColor7,
          fontSize: 30,
          height: 1,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.3334423928571427,
        ),
        validator: validator,
        decoration: new InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide:
                BorderSide(color: AppColors.backgroundColor9, width: 1.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide:
                BorderSide(color: AppColors.backgroundColor9, width: 1.0),
          ),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide(width: 1, color: AppColors.backgroundColor9
                // style: BorderStyle.none,
                ),
          ),
          filled: true,
          fillColor: AppColors.white,
        ),
      ),
    );
  }
}
