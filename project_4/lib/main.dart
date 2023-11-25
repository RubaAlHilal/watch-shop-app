import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/auth/auth_bloc.dart';
import 'package:project_4/blocs/cart/bloc/cart_bloc.dart';
import 'package:project_4/blocs/obsecure/bloc/obsecure_bloc.dart';
import 'package:project_4/blocs/user/bloc/user_bloc.dart';
import 'package:project_4/helper/bloc_observor.dart';
import 'package:project_4/screens/sign_in_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => ObsecureBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: false),
        debugShowCheckedModeBanner: false,
        home: const SignInScreen(),
      ),
    );
  }
}
