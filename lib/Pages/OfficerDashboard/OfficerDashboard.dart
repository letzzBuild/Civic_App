import 'package:civic_app/Pages/OfficerDashboard/Notification.dart';
import 'package:civic_app/Pages/OfficerDashboard/Profile.dart';
import 'package:civic_app/Resusable_Component/OfficerDashboardPage.dart';
import 'package:flutter/material.dart';
import 'package:countup/countup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfficerDashboard extends StatefulWidget {
  @override
  _OfficerDashboardState createState() => _OfficerDashboardState();
}

class _OfficerDashboardState extends State<OfficerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[900],
          title: Text("Officer Dashboard"),
        ),
        drawer: new Drawer(
          child: ListView(
            children: [
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/officerDashboard');
                },
                title: Text("Home"),
              ),
              Divider(),
              ListTile(
                title: Text("All Complaints"),
                onTap: () {
                  Navigator.pushNamed(
                      context, '/officerDashboard/AllComplaints');
                },
              ),
              Divider(),
              ListTile(
                title: Text("Pending Complaints"),
                onTap: () {
                  Navigator.pushNamed(
                      context, '/officerDashboard/Pendingcomplaint');
                },
              ),
              Divider(),
              ListTile(
                title: Text("Resolved Issues"),
                onTap: () {
                  Navigator.pushNamed(
                      context, '/officerDashboard/Resolvedcomplaint');
                },
              ),
              Divider(),
              //  ListTile(
              //    title: Text("Notification"),
              //      onTap: (){
              //      Navigator.pushNamed(context, '/officerDashboard/Notification');
              //    },
              //  ),
              // Divider(),
              ListTile(
                title: Text("Profile"),
                onTap: () {
                  Navigator.pushNamed(context, '/officerDashboard/profile');
                },
              ),
            ],
          ),
        ),
        body: OfficerDashBoardPage());
  }
}
