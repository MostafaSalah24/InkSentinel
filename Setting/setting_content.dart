import 'package:flutter/material.dart';
import '../Change pass/changepass.dart';
import '../Edit/edit.dart';
import '../LogIn/log_in.dart';

class SettingContent extends StatefulWidget {
  const SettingContent({super.key});

  @override
  State<SettingContent> createState() => _SettingContentState();
}

class _SettingContentState extends State<SettingContent> {
  bool _isLanguageExpanded = false;
  String _selectedLanguage = 'English'; // Default selection

  void _toggleLanguageList() {
    setState(() {
      _isLanguageExpanded = !_isLanguageExpanded;
    });
  }

  void _selectLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
      _isLanguageExpanded = false; // Close list after selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildSettingItem(
                    icon: Icons.person_outline_outlined,
                    label: 'Edit Profile',
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Edit()),
                    ),
                  ),
                  _buildSettingItem(
                    icon: Icons.language_outlined,
                    label: 'Languages',
                    trailingIcon: Icons.expand_more,
                    onTap: _toggleLanguageList,
                  ),

                  // Expanded Language List (Takes Up Space on Page)
                  if (_isLanguageExpanded) _buildLanguageSelection(),

                  _buildSettingItem(
                    icon: Icons.notifications_outlined,
                    label: 'Privacy Policy',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: Icons.lock_outlined,
                    label: 'Change Password',
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Changepass()),
                    ),
                  ),
                  _buildSettingItem(
                    icon: Icons.logout_outlined,
                    label: 'Log Out',
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LogIn()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String label,
    IconData? trailingIcon,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: const Color(0xffD9D9D9))),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        trailing: trailingIcon != null
            ? IconButton(
                icon: Icon(trailingIcon),
                onPressed: onTap,
              )
            : null,
        onTap: onTap,
      ),
    );
  }

  Widget _buildLanguageSelection() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffD9D9D9)),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          _buildLanguageOption('English'),
          const Divider(height: 1, color: Colors.black26),
          _buildLanguageOption('Arabic'),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    return ListTile(
      title: Text(
        language,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: _selectedLanguage == language
          ? const Icon(Icons.check, color: Colors.green)
          : null,
      onTap: () => _selectLanguage(language),
    );
  }
}
