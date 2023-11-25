import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/auth/auth_bloc.dart';
import 'package:project_4/blocs/auth/auth_event.dart';
import 'package:project_4/blocs/auth/auth_state.dart';
import 'package:project_4/screens/NavigationBar/navigation_bar_widget.dart';
import 'package:project_4/screens/sign_up_screen.dart';
import 'package:project_4/widgets/elevated_button.dart';
import '../widgets/text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(),
        passwordController = TextEditingController();

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
                        if (state is ErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)));
                        } else if (state is SigninState) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNavBar()),
                              (route) => false);
                        }
                      },
                      child: CustomElevatedButton(
                        text: 'Sign in',
                        color: const Color(0xfffccf78),
                        onPressedFunc: () {
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
                                      builder: (context) =>
                                          const SignUpScreen(),
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

  // void checkUserSignInInfo(BuildContext context) {
  //   List doesExists = [];
  //   if (emailController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("Please write your email")));
  //   } else if (passwordController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("Please write your password")));
  //   } else {
  //     usersList.map((e) {
  //       if (emailController.text.trim().toLowerCase() ==
  //               e.email!.toLowerCase() &&
  //           passwordController.text.trim().toLowerCase() ==
  //               e.password!.toLowerCase()) {
  //         doesExists.add(true);
  //         currentUser = e;
  //         loggedInUsers.add(e);

  //         Navigator.pushAndRemoveUntil(
  //             context,
  //             MaterialPageRoute(builder: (context) => const BottomNavBar()),
  //             (route) => false);
  //       }
  //     }).toList();
  //     if (!doesExists.contains(true)) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text("This Account does not exist")));
  //     }
  //   }
  // }
}
