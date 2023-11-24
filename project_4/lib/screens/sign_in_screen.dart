import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:project_4/blocs/auth/auth_bloc.dart';
import 'package:project_4/blocs/auth/auth_event.dart';
import 'package:project_4/blocs/auth/auth_state.dart';
import 'package:project_4/screens/NavigationBar/navigation_bar_widget.dart';
import 'package:project_4/screens/sign_up_screen.dart';
import 'package:project_4/widgets/elevated_button.dart';

import '../data/global_data.dart';
import '../data/user_data_set.dart';
import '../models/user_model.dart';
import '../widgets/text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    if (usersList.isEmpty) {
      for (var users in usersDataSet) {
        usersList.add(User(
            address: users["address"],
            userAvatar: users["userAvatar"],
            email: users["email"],
            password: users["password"],
            mobileNumber: users["mobileNumber"],
            name: users["name"]));
      }
    }
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(children: [
          Image.asset('assets/images/in.png'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 285),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Lets Sign in',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'PlayfairDisplay',
                              color: Color.fromARGB(255, 2, 32, 84)),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Fill the details below to continue.'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
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
                        lable: 'Password',
                        hint: 'Enter Passsword',
                        icon: Icons.visibility_outlined,
                        controller: passwordController,
                        isPassword: true),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style:
                              TextStyle(color: Color.fromARGB(255, 2, 32, 84)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        // DONE
                        if (state is SigninState) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNavBar()),
                              (route) => false);
                        } else if (state is ErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)));
                        }
                      },
                      child: CustomElevatedButton(
                        text: 'Sign in',
                        color: const Color(0xfffccf78),
                        onPressedFunc: () {
                          // DONE
                          context.read<AuthBloc>().add(SigninEvent(
                              emailController.text, passwordController.text));
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('OR'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            minimumSize: const Size(400, 60),
                            backgroundColor: const Color(0xfff9f8f8)),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/g.PNG',
                              height: 25,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Sign in with Google',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('New to ADS Watch?'),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ));
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 2, 32, 84)),
                              )),
                        )
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
