import 'package:flutter/material.dart';

Widget customFormField({
  String labelText,
  Function onTap,
  bool obscureText = false,
  TextInputType keyBordType = TextInputType.text,
  Widget suffixIcon,
  Widget prefixIcon,
  TextEditingController controller,
  Function validator,
  Function onChange,
  bool autofocus = false,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 40.0),
    child: TextFormField(
      onChanged: onChange,
      autofocus: autofocus,
      validator: validator,
      keyboardType: keyBordType,
      onTap: onTap,
      obscureText: obscureText,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff79c3d4),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 18,
          color: Colors.black.withOpacity(.5),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    ),
  );
}
