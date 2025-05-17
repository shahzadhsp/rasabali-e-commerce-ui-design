import 'package:flutter/material.dart';
import 'package:rasabali1/Profile/view_profile.dart';
import 'package:rasabali1/authen/forget_pass.dart';
import 'package:rasabali1/order/myorders.dart';
import 'package:rasabali1/settings/login_method.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff4ab3c),
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color(0xfff4ab3c),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: size.width * 0.2,
                    backgroundImage: const AssetImage('assets/images/2.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Hosting shop',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Account Overview",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView(
                          children: [
                            _buildListTile(
                              icon: Icons.person_outline,
                              text: 'My Profile',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfileScreen(),
                                  ),
                                );
                              },
                            ),
                            _buildListTile(
                              icon: Icons.local_shipping_outlined,
                              text: 'My Orders',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyOrdersPage(),
                                  ),
                                );
                              },
                            ),
                            _buildListTile(
                              icon: Icons.contact_mail_outlined,
                              text: 'Contact Us',
                              onTap: () {
                                // Navigate to Contact Us screen
                              },
                            ),
                            _buildListTile(
                              icon: Icons.rate_review_outlined,
                              text: 'Rating & Review',
                              onTap: () {
                                // Navigate to Rating & Review screen
                              },
                            ),
                            _buildListTile(
                              icon: Icons.privacy_tip_outlined,
                              text: 'Privacy Policy',
                              onTap: () {
                                // Navigate to Privacy Policy screen
                              },
                            ),
                            _buildSectionHeader("Account Settings"),
                            _buildListTile(
                              icon: Icons.login,
                              text: 'Login Method',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginMethod(),
                                  ),
                                );
                              },
                            ),
                            _buildListTile(
                              icon: Icons.security_outlined,
                              text: 'Account Security',
                              onTap: () {
                                // Add logic if needed
                              },
                            ),
                            _buildListTile(
                              icon: Icons.lock_outline,
                              text: 'Change Password',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResetPasswordScreen(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            _buildSectionHeader("Preferences"),
                            _buildListTile(
                              icon: Icons.language,
                              text: 'Language',
                              onTap: () {
                                // Navigate to language selection screen
                              },
                            ),
                            _buildListTile(
                              icon: Icons.attach_money,
                              text: 'Currency',
                              onTap: () {
                                // Navigate to currency selection screen
                              },
                            ),
                            _buildListTile(
                              icon: Icons.notifications_none,
                              text: 'Notifications',
                              onTap: () {
                                // Navigate to notifications settings screen
                              },
                            ),
                            const SizedBox(height: 20),
                            _buildSectionHeader("Others"),
                            _buildListTile(
                              icon: Icons.feedback_outlined,
                              text: 'Leave Feedback',
                              onTap: () {
                                // Navigate to feedback screen
                              },
                            ),
                            _buildListTile(
                              icon: Icons.info_outline,
                              text: 'About',
                              onTap: () {
                                // Navigate to about screen
                              },
                            ),
                            _buildListTile(
                              icon: Icons.logout,
                              text: 'Logout',
                              onTap: () {
                                _showLogoutDialog(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xfff4ab3c),
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: onTap,
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Add logout logic here (e.g., clear token/session and navigate to login)
            },
            child: const Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
