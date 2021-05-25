import 'package:flutter/material.dart';
class Removeofficer extends StatefulWidget {
  @override
  _RemoveofficerState createState() => _RemoveofficerState();
}

class _RemoveofficerState extends State<Removeofficer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('Admin Dashboard'),),
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
        body: Container(
          padding: const EdgeInsets.only(left:30,right:30,top:60),
          child: Column
        (mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                Material(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        child: TextFormField(
                      
                          validator: (value) {
                            if (value.isEmpty) {
                              return "This field is Required";
                            }
                            return null;
                          },
                          // controller: _userNameController,
                          keyboardType: TextInputType.emailAddress,

                          decoration: const InputDecoration(
                            
                             contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            prefixIcon: Icon(
                              Icons.email,
                              size: 20,
                              color: Colors.black
                            ),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Email',
                            
                             
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      SizedBox(height:20),
                      RaisedButton(
                        color: Colors.purple[900],
                        onPressed: (){

                      },
                      child: Text('Remove',style: TextStyle(color:Colors.white,fontSize: 20),),)

        ],),),
      
    );
  }
}