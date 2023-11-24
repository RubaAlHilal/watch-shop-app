import 'package:flutter/material.dart';
import 'package:project_4/models/user_model.dart';
import 'package:project_4/screens/sign_in_screen.dart';
import 'package:project_4/widgets/elevated_button.dart';
import 'package:project_4/widgets/text_field.dart';

import '../data/global_data.dart';
import 'NavigationBar/navigation_bar_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    child: CustomElevatedButton(
                      text: 'Sign Up',
                      color: const Color(0xfffccf78),
                      onPressedFunc: () {
                        checkUserSignUpInfo(context);
                      },
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
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                )),
                            child: const Text(
                              'sign in',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 32, 84),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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

  void checkUserSignUpInfo(BuildContext context) {
    List doesExists = [];
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please write your email")));
    } else if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please write your password")));
    } else {
      usersList.map((e) {
        if (e.email!.contains(emailController.text.trim().toLowerCase())) {
          doesExists.add(true);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("This Email already have an account")));
        }
      }).toList();
      if (!doesExists.contains(true)) {
        currentUser = User(
            address: [],
            userAvatar: "",
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            mobileNumber: '',
            name: nameController.text.trim());
        loggedInUsers.add(currentUser);
        usersList.add(currentUser);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavBar()),
            (route) => false);
      }
    }
  }
}
