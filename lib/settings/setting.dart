import 'package:flutter/material.dart';
import 'package:rasabali1/order/myorders.dart';
import 'package:rasabali1/settings/login_method.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    children: [
                      _buildSectionHeader("Account Settings"),
                      _buildListTile(
                        icon: Icons.login,
                        text: 'Login Method',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginMethod(),
                            ),
                          );
                        },
                      ),
                      _buildListTile(
                        icon: Icons.security_outlined,
                        text: 'Account security',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyOrdersPage(),
                            ),
                          );
                        },
                      ),
                      _buildListTile(
                        icon: Icons.lock_outline,
                        text: 'Change Password',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginMethod(),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
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
      leading: Icon(icon, color: const Color(0xfff4ab3c)),
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
      onTap: onTap,
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
              // TODO: Add logout logic here
            },
            child: const Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
