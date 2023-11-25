import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/auth/auth_bloc.dart';
import 'package:project_4/blocs/auth/auth_event.dart';
import 'package:project_4/blocs/auth/auth_state.dart';
import 'package:project_4/screens/sign_in_screen.dart';
import 'package:project_4/widgets/elevated_button.dart';
import 'package:project_4/widgets/text_field.dart';
import 'NavigationBar/navigation_bar_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(),
        nameController = TextEditingController(),
        passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Image.asset('assets/images/up.png'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 250),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Lets Sign Up',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'PlayfairDisplay',
                              color: Color.fromARGB(255, 2, 32, 84)),
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Lets sign up to get rewards.'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: CustomTextField(
                        lable: 'Username or Email',
                        hint: 'Enter Username or Email',
                        icon: Icons.mail_outline,
                        controller: emailController,
                        isPassword: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: CustomTextField(
                        lable: 'Full Name',
                        hint: 'Enter Name Here',
                        icon: Icons.person_2_outlined,
                        controller: nameController,
                        isPassword: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: CustomTextField(
                        lable: 'Passwor',
                        hint: 'Enter Password',
                        icon: Icons.visibility_outlined,
                        controller: passwordController,
                        isPassword: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        // DONE!!!!!!!
                        if (state is SignupState) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNavBar()),
                              (route) => false);
                        } else if (state is ErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                state.message,
                              ),
                            ),
                          );
                        }
                      },
                      child: CustomElevatedButton(
                        text: 'Sign Up',
                        color: const Color(0xfffccf78),
                        onPressedFunc: () {
                          context.read<AuthBloc>().add(SignupEvent(
                              nameController.text,
                              emailController.text,
                              passwordController.text));
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Joined us before?'),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen(),
                                    ));
                              },
                              child: const Text(
                                'sign in',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 2, 32, 84),
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
