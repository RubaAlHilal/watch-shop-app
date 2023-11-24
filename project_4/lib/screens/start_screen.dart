import 'package:flutter/material.dart';
import 'package:project_4/widgets/elevated_button.dart';

import 'sign_in_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/start.png'),
                    fit: BoxFit.cover)),
          ),
          const Positioned(
            top: 100,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Universal Timekepers',
                      style: TextStyle(

                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'PlayfairDisplay')),
                  Text('of the World',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'PlayfairDisplay')),
                  Padding(
                    padding: EdgeInsets.only(top: 16),

                    child: Text(
                      'it is a long established fact that a reader will',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'be distracted by the readable content',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 550),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),

        child: CustomElevatedButton(
          text: 'Sign Up',
          color: const Color(0xfffccf78),
          onPressedFunc: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ));
          },
        ),

      ),
    );
  }
}
