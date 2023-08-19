// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/helpers/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.title,
    this.hint,
    this.label,
    this.textInputType,
    this.suffixIcon,
    this.obscureText,
    this.readOnly,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.controller,
  });
  String title;
  bool? obscureText;
  bool? readOnly;
  String? hint;
  Widget? label;
  Widget? suffixIcon;
  void Function(String)? onChanged;
  void Function(String)? onSubmitted;
  String? Function(String?)? validator;
  TextInputType? textInputType;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: GoogleFonts.lato(
                  color: Colors.white.withOpacity(0.8700000047683716),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          style: const TextStyle(color: AppColors.whiteText),
          decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.displayMedium,
            fillColor: const Color(0xFF1C1C1C),
            filled: true,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.whiteText),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.whiteText),
            ),
            hintText: hint,
            label: label,
            suffixIconColor: Colors.white,
            suffixIcon: suffixIcon,
          ),
          keyboardType: textInputType,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          obscureText: obscureText ?? false,
          readOnly: readOnly ?? false,
        )
      ],
    );
  }
}
