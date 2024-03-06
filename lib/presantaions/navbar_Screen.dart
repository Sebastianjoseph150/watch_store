import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screening/Bloc/bottom_navbar/bloc/navbar_bloc.dart';
import 'package:screening/presantaions/cart_screen.dart';
import 'package:screening/presantaions/homscreen.dart';
import 'package:screening/presantaions/profile_Screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'watch Store',
            style: TextStyle(color: Colors.white),
          ),
          titleSpacing: 10,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
          ],
          iconTheme: const IconThemeData(
              color: Colors.white), // Set icon color to white
        ),
        drawer: Drawer(),
        body: BlocConsumer<NavbarBloc, NavbarState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ScreenChangedState) {
              if (state.index == 0) {
                return HomeScreen();
              } else if (state.index == 1) {
                return CartPage();
              } else {
                return const Profile();
              }
            }

            return HomeScreen();
          },
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}

// BottomNavBar
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarBloc, NavbarState>(
      builder: (context, state) {
        final int currentIndex =
            (state is ScreenChangedState) ? state.index : 0;

        return BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          onTap: (index) {
            BlocProvider.of<NavbarBloc>(context)
                .add(ButtonPressedEvent(index: index));
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
