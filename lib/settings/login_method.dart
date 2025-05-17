import 'package:flutter/material.dart';

class LoginMethod extends StatefulWidget {
  const LoginMethod({super.key});

  @override
  State<LoginMethod> createState() => _LoginMethodState();
}

class _LoginMethodState extends State<LoginMethod> {
  final Map<String, bool> isLinked = {
    'email': true,
    'phone': false,
    'google': true,
    'facebook': false,
    'wechat': false,
    'kakao': true,
    'naver': false,
  };

  final Map<String, bool> isVerified = {
    'email': true,
    'phone': false,
    'google': true,
    'facebook': false,
    'wechat': false,
    'kakao': true,
    'naver': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Login Method",
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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSectionHeader("Email and Password"),
            _buildListTile(
              icon: Icons.email_outlined,
              text: 'Email',
              keyName: 'email',
            ),
            const SizedBox(height: 20),
            _buildSectionHeader("Social Media"),
            _buildListTile(
              icon: Icons.g_mobiledata,
              text: 'Google',
              keyName: 'google',
            ),
            _buildListTile(
              icon: Icons.apple,
              text: 'Apple',
              keyName: 'apple',
            ),
            _buildListTile(
              icon: Icons.message,
              text: 'SMS',
              keyName: 'sms',
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
    required String keyName,
    bool hideMenu = false,
  }) {
    final linked = isLinked[keyName] ?? false;
    final verified = isVerified[keyName] ?? false;

    String statusText = linked ? 'Linked' : 'Not Linked';
    String verifyText = verified ? 'Verified' : 'Not Verified';

    return ListTile(
      leading: Icon(icon, color: const Color(0xfff4ab3c)),
      title:
          Text(text, style: const TextStyle(fontSize: 18, color: Colors.black)),
      subtitle: Text(
        "$statusText • $verifyText",
        style: TextStyle(color: linked ? Colors.green : Colors.red),
      ),
      trailing: hideMenu
          ? null
          : PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  if (value == 'Link') isLinked[keyName] = true;
                  if (value == 'Unlink') isLinked[keyName] = false;
                  if (value == 'Verify') isVerified[keyName] = true;
                });
              },
              itemBuilder: (context) => [
                if (!linked)
                  const PopupMenuItem(value: 'Link', child: Text('Link')),
                if (linked)
                  const PopupMenuItem(value: 'Unlink', child: Text('Unlink')),
                if (!verified)
                  const PopupMenuItem(value: 'Verify', child: Text('Verify')),
              ],
              icon: const Icon(Icons.more_vert, color: Colors.black),
            ),
    );
  }
}
