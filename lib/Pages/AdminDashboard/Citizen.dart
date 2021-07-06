import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final  list=['Ganesh','Gautam','Prachi'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
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
            ),Divider(),
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
      
      body:ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
        return Container(
          // padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width:0),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.purple[900],
                    child: Text(list[index][0]),
                  ),
                  SizedBox(width:20),
                  Text(list[index]),
                  SizedBox(width:200),
                  IconButton(icon: Icon(Icons.delete), onPressed: (){

          }),
                ],
              ),
            ),
          ],
        ),

      );
       },
      ),
    );
  }
}
