import 'package:civic_app/Resusable_Component/MainDashboardPage.dart';
import 'package:flutter/material.dart';
class Citizen extends StatefulWidget {
  @override
  _CitizenState createState() => _CitizenState();
}

class _CitizenState extends State<Citizen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.purple[900],
        title: Text("Citizen DashBoard"),),
      drawer: new Drawer(
        child: ListView(children: [
          
          SizedBox(height:40),
          IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
 Navigator.of(context).pop();
          }),
          Divider(),
          ListTile(
            title: Text("Profile"),
            onTap: (){
            
               Navigator.of(context).pushNamed("/citizenDashboard/profile");
            },
            
          ),
          Divider(),
          ListTile(
              title: Text("Add Complaints"),
              onTap: (){
              
                Navigator.of(context).pushNamed('/citizenDashboard/AddComplaints');
              },
          ),
           Divider(),
          ListTile(
              title: Text("View Complaints"),
              onTap: (){
                Navigator.of(context).pushNamed('/citizenDashboard');
              },
          )
        ],),

      ),
      body: MainDashBoardPage(),
    );
  }
}









