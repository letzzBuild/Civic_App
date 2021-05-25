import 'package:flutter/material.dart';

class AdminNotification extends StatefulWidget {
  @override
  _AdminNotificationState createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
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
            new ListTile(
                title: new Text(
                  'Add officer',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/Admin/addofficer');
                }),
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
      body: TabBarView(controller: _tabController, children: [
        Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Cmpl_Id :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('')
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Officer :',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('')
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('City :',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('')
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Message :',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('')
                  ],
                )
              ],
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Cmpl_Id :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('')
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Officer :',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('')
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('City :',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('')
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Message :',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('')
                  ],
                )
              ],
            )),
      ]),
    );
  }
}
