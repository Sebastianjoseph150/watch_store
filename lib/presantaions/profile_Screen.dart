import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('Assets/images/images (1).jpeg'),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  'Name',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading:
                          const Icon(Icons.location_city, color: Colors.black),
                      title: const Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.notification_add,
                          color: Colors.black),
                      title: const Text(
                        'Admin',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.shield, color: Colors.black),
                      title: const Text(
                        'Privcay policy',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.book, color: Colors.black),
                      title: const Text(
                        'Terms & conditons',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black54),
                      onTap: () {
                        // Handle onTap action
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.add_box, color: Colors.black),
                      title: const Text(
                        'My orders',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: const Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Log out'),
                              content: const Text(
                                  'Are you sure you want to log out?'),
                              actions: [
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Log out'),
                                  onPressed: () {
                                    // You can also navigate to the login screen or perform any other actions
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
