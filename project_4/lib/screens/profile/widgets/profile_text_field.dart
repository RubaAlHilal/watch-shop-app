import 'package:flutter/material.dart';

class ProfileTextField extends StatefulWidget {
  const ProfileTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.isPassword,
      required this.inputType})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final TextInputType inputType;

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        obscureText: (widget.isPassword) ? isObscure : false,
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text(widget.label),
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          suffixIcon: Visibility(
            visible: widget.isPassword,
            child: InkWell(
              borderRadius: BorderRadius.circular(35),
              onTap: () {
                isObscure = !isObscure;
                setState(() {});
              },
              child: Icon(
                isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
