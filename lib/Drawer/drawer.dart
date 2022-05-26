import 'package:bmi_calculator/Constants/constants.dart';
import 'package:bmi_calculator/Pages/Select%20Gender/gender_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    const name = 'Your Email';
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: Image.asset(
                          "assets/icons/left.png",
                          color: mainColor,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Back".toUpperCase(),
                      style: const TextStyle(
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildHeader(name: name, email: user.email!, onClicked: () {}
                // => Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => UserPage(
                //     name: 'Sarah Abs',
                //     urlImage: urlImage,
                //   ),
                // )),
                ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildSearchField(),
                  const SizedBox(height: 24),
                  buildMenuItem(
                      text: 'Home',
                      icon: Icons.home_rounded,
                      onClicked: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectGender(),
                            ));
                      }),
                  const SizedBox(height: 16),
                  buildMenuItem(
                      text: 'Contact Doctor',
                      icon: FontAwesomeIcons.userDoctor,
                      onClicked: () {}),
                  const SizedBox(height: 16),
                  buildMenuItem(
                      text: 'Updates', icon: Icons.update, onClicked: () {}),
                  const SizedBox(height: 24),
                  Divider(color: Colors.grey[700]),
                  const SizedBox(height: 24),
                  buildMenuItem(
                      text: 'Notifications',
                      icon: Icons.notifications_outlined,
                      onClicked: () {}),
                  const SizedBox(height: 16),
                  buildMenuItem(
                      text: 'Log out',
                      icon: Icons.logout,
                     onClicked: () {
                        //sign out
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthPage(),
                            ));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 20)),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                child: Icon(
                  FontAwesomeIcons.user,
                  color: mainColor,
                ),
                backgroundColor: active,
              ),
              const SizedBox(width: 20),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: mainColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700],
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.grey[700];

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: const Icon(
          Icons.search,
          color: mainColor,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: mainColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: mainColor,
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black;
    return ListTile(
      leading: Icon(
        icon,
        color: mainColor,
        size: 30,
      ),
      title: Text(text, style: const TextStyle(color: color, fontSize: 17.0)),
      onTap: onClicked,
    );
  }
}
