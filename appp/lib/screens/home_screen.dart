import 'package:flutter/material.dart';
import '../chat_screen.dart';
import '../profile_screen.dart';
import '../settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> boards = [
    {'name': 'Tech Talk', 'icon': Icons.computer},
    {'name': 'Life & Wellness', 'icon': Icons.favorite},
    {'name': 'Academics', 'icon': Icons.school},
    {'name': 'Announcements', 'icon': Icons.announcement},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Message Boards')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Navigation',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Message Boards'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('Profile'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProfileScreen()),
                  ),
            ),
            ListTile(
              title: Text('Settings'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SettingsScreen()),
                  ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: boards.length,
        itemBuilder: (context, index) {
          final board = boards[index];
          return ListTile(
            leading: Icon(board['icon']),
            title: Text(board['name']),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(boardName: board['name']),
                  ),
                ),
          );
        },
      ),
    );
  }
}
