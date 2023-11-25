import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/user/bloc/user_bloc.dart';
import 'package:project_4/blocs/user/bloc/user_event.dart';
import 'package:project_4/blocs/user/bloc/user_state.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/models/user_model.dart';
import 'package:project_4/screens/NavigationBar/navigation_bar_widget.dart';
import 'package:project_4/widgets/custom_app_bar.dart';
import 'package:project_4/widgets/custom_button.dart';

import 'widgets/profile_text_field.dart';
import 'widgets/user_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: currentUser.name);

    TextEditingController phoneController =
        TextEditingController(text: currentUser.mobileNumber);

    TextEditingController emailController =
        TextEditingController(text: currentUser.email);

    TextEditingController passwordController =
        TextEditingController(text: currentUser.password);

    return Scaffold(
      appBar: customAppBar(
          title: "My Profile",
          context: context,
          hasAction: false,
          onPressedFunc: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const BottomNavBar()));
          }),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .65,
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Expanded(child: UserAvatar()),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    ProfileTextField(
                        controller: nameController,
                        label: "Name",
                        isPassword: false,
                        inputType: TextInputType.text),
                    ProfileTextField(
                        controller: phoneController,
                        label: "Mobile Number",
                        isPassword: false,
                        inputType: TextInputType.number),
                    ProfileTextField(
                        controller: emailController,
                        label: "Email Address",
                        isPassword: false,
                        inputType: TextInputType.text),
                    ProfileTextField(
                        controller: passwordController,
                        label: "Password",
                        isPassword: true,
                        inputType: TextInputType.text),
                    BlocListener<UserBloc, UserState>(
                      listener: (context, state) {
                        if (state is ErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)));
                        } else if (state is UpdateDetailsState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Your information is up-to-date")));
                        }
                      },
                      child: CustomButton(
                          content: "Update",
                          hasIcon: false,
                          onPressedFunc: () {
                            context.read<UserBloc>().add(UpdateUserDetailsEvent(
                                user: User(
                                    address: [],
                                    userAvatar: "",
                                    email: emailController.text,
                                    password: passwordController.text,
                                    mobileNumber: phoneController.text,
                                    name: nameController.text)));
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
