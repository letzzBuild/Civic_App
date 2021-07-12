import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateComplaint extends StatefulWidget {
  @override
  _UpdateComplaintState createState() => _UpdateComplaintState();
}

class _UpdateComplaintState extends State<UpdateComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[900],
          title: Text('Pending Issues'),
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
                Navigator.pushNamed(context, '/officerDashboard/AllComplaints');
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
            ListTile(
              title: Text("Update Complaint Status"),
              onTap: () {
                Navigator.pushNamed(
                    context, '/officerDashboard/updateComplaint');
              },
            ),
            Divider(),
            ListTile(
              title: Text("Profile"),
              onTap: () {
                Navigator.pushNamed(context, '/officerDashboard/profile');
              },
            ),
          ],
        )),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: PendingView(),
                ),
              ]),
        ));
  }
}

class PendingView extends StatefulWidget {
  @override
  _PendingViewState createState() => _PendingViewState();
}

class _PendingViewState extends State<PendingView> {
  int complaint_id;
  String status;
  String action_taken;
  int progress;

  List<dynamic> pendingissue;
  @override
  @override
  void initState() {
    super.initState();
    // UpdateComplaint();
  }

  void updateComplaint() async {
    var data = {
      "complaint_id": complaint_id,
      "action_taken": action_taken,
      "status": status,
      "progress": progress
    };

    var res = await http.get(
        Uri.http("192.168.43.187:8000", "complaints/updatecomplaint/"),
        headers: <String, String>{
          'Content-Type': 'application/jsone;  charset=UTF-8'
        });
  }

  void pendingIssue() async {
    var res = await http.get(
        Uri.http("192.168.43.187:8000", "complaints/pending/complaints/"),
        headers: <String, String>{
          'Content-Type': 'application/jsone;  charset=UTF-8'
        });
    pendingissue = jsonDecode(res.body);
    setState(() {
      pendingissue = jsonDecode(res.body);
      print(pendingissue);
    });
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pendingissue.length,
      itemBuilder: (context, index) {
        return pendingissue != null
            ? ExpansionTile(
                title: Text(
                  pendingissue[index]['comp_title'],
                ),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Title :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 20),
                      Text(pendingissue[index]['comp_title'])
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Complaint Date :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 20),
                      Text(pendingissue[index]['comp_date'])
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Description:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 20),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        width: 150,
                        child: Text(
                          pendingissue[index]['comp_desc'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: false,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'complaintid',
                            labelText: 'complaint Id',
                          ),
                          onSaved: (var value) {
                            complaint_id = pendingissue[index]['comp_id'];
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: false,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'status',
                            labelText: 'status',
                          ),
                          onSaved: (var value) {
                            status = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: false,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'progress',
                            labelText: 'progress',
                          ),
                          onSaved: (var value) {
                            progress = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'action taken',
                          labelText: 'Action Taken',
                        ),
                        onSaved: (var value) {
                          action_taken = value;
                        },
                      ),
                    ],
                  ),
                ],
              )
            : Center(
                child: Text("No pending Complaints"),
              );
      },
    );
  }
}
