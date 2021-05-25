import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Citizen'),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 40),
            new Divider(),
            new ListTile(
              title: new Text(
                'Home',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Admin/Home');
              },
            ),
            Divider(),
            new ListTile(
              title: new Text(
                'Add officer',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Admin/addofficer');
              },
            ),
            Divider(),
            new ListTile(
              title: new Text(
                'Delete Officer',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Admin/removeofficer');
              },
            ),
            new ListTile(
              title: new Text(
                'Users',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Admin/citizen');
              },
            ),
            Divider(),
            new ListTile(
              title: new Text(
                'Complaints',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Admin/Complaints');
              },
            ),
            new Divider(),
          ],
        ),
      ),
    );
  }
}
