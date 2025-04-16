import 'package:flutter/material.dart';
import '../History/hist.dart';
import '../Home/home.dart';
import '../Sign up/sign_up.dart';
import '../LogIn/log_in.dart';
import '../Setting/setting_content.dart';
import '../help/help_content.dart';
import '../verification/verification.dart';

class BasePageLayout extends StatefulWidget {
  const BasePageLayout({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BasePageLayoutState createState() => _BasePageLayoutState();
}

class _BasePageLayoutState extends State<BasePageLayout> {
  int _selectedIndex = 0;

  static const List<String> _titles = ['Home', 'Setting', 'Help'];
  static const List<Widget> _pages = [
    HomeContent(),
    SettingContent(),
    HelpContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context); // Close the drawer before navigation
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/images/logo2.jpg',
            width: 200,
            height: 60,
          ),
        ),
        centerTitle: true,
        title: Text(_titles[_selectedIndex]),
        toolbarHeight: 50,
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
              decoration: const BoxDecoration(color: Color(0xFF15B7BA)),
              child: Text(
                _titles[_selectedIndex],
                style: const TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
            _buildDrawerItem(
              icon: Icons.compare,
              text: 'Signature verification',
              onTap: () => _navigateTo(context, const Verification()),
            ),
            _buildDrawerItem(
              icon: Icons.history,
              text: 'History',
              onTap: () => _navigateTo(context, const HistoryPage()),
                
              
            ),
            _buildDrawerItem(
              icon: Icons.add_circle_outline,
              text: 'Add Account',
              onTap: () => _navigateTo(context, const SignUp()),
            ),
            _buildDrawerItem(
              icon: Icons.logout_outlined,
              text: 'Log out',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LogIn()),
                );
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.help_outline_outlined), label: ''),
        ],
        iconSize: 30,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF15B7BA),
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
