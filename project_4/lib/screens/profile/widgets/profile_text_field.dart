import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/obsecure/bloc/obsecure_bloc.dart';
import 'package:project_4/blocs/obsecure/bloc/obsecure_event.dart';
import 'package:project_4/blocs/obsecure/bloc/obsecure_state.dart';

class ProfileTextField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<ObsecureBloc, ObsecureState>(
        builder: (context, state) {
          return TextField(
            obscureText: (isPassword) ? state.isObscure : false,
            controller: controller,
            decoration: InputDecoration(
              label: Text(label),
              labelStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              suffixIcon: Visibility(
                visible: isPassword,
                child: InkWell(
                  borderRadius: BorderRadius.circular(35),
                  onTap: () {
                    context
                        .read<ObsecureBloc>()
                        .add(ObsecureTextfield(isObscure: !state.isObscure));
                  },
                  child: Icon(
                    state.isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
