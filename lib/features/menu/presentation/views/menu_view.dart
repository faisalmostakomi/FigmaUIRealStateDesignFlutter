import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      body: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Demo User'),
            accountEmail: Text('user@example.com'),
            currentAccountPicture: CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.png')),
          ),
          ListTile(leading: Icon(Icons.home), title: Text('Home'), onTap: ()=> Navigator.of(context).pop()),
          ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          ListTile(leading: Icon(Icons.info), title: Text('About')),
        ],
      ),
    );
  }
}
