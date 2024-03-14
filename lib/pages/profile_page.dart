import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtek_intern_assignment/pages/country_selection_page.dart';
import 'package:hashtek_intern_assignment/pages/signup_page.dart';
import 'package:hashtek_intern_assignment/services/authentication.dart';
import 'package:hashtek_intern_assignment/widgets/custom_appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedCountry = '';
  String countryName = '';

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        fontSize: 24,
        isLeading: false,
        title: 'Profile Page',
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/random_person.jpg'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        user?.displayName ?? 'Arpit Verma',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('(${user?.email})' ?? 'randomperson@gmail.com'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                    ],
                  ),
                ),
                _buildRoundedTile(
                    'Edit Profile', Icons.person_4_outlined, () {}),
                _buildRoundedTile('Favorites', Icons.favorite_border, () {}),
                _buildCountryTile('Country', CupertinoIcons.flag, () async {
                  final selectedCountryImagePath = await Get.to(() =>
                      CountrySelectionScreen(selectedCountry: selectedCountry));
                  if (selectedCountryImagePath != null) {
                    setState(() {
                      selectedCountry = selectedCountryImagePath[0];
                      countryName = selectedCountryImagePath[1];
                    });
                  }
                }),
                _buildRoundedTile(
                    'Notifications', Icons.notifications_none_rounded, () {}),
                _buildRoundedTile('Settings', Icons.help, () {}),
                _buildRoundedTile('Help & Feedback', Icons.help, () {}),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      logout();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(40.0),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BottomAppBar(
            color: Colors.grey[850],
            notchMargin: 6.0,
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {},
                ),
                const SizedBox(),
                IconButton(
                  icon: const Icon(Icons.bookmark),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {},
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        mini: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(
          CupertinoIcons.camera_viewfinder,
          color: Colors.black,
          size: 36,
        ),
      ),
    );
  }

  Widget _buildRoundedTile(String title, IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[850],
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  Widget _buildCountryTile(String title, IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[850],
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(countryName),
        trailing: Image.asset(selectedCountry),
        onTap: onTap,
      ),
    );
  }

  void logout() async {
    await SignUpAndSignIn.logout();

    Get.offAll(() => SignUpPage());
  }
}
