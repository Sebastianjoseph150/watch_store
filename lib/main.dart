import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screening/Bloc/cart/bloc/cart_bloc.dart';
import 'package:screening/Repository/cart_repository.dart';
import 'package:screening/presantaions/splash_screen.dart';
import 'package:screening/Bloc/bottom_navbar/bloc/navbar_bloc.dart';
// Import your other Blocs here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavbarBloc>(
          create: (context) => NavbarBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(CartRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
