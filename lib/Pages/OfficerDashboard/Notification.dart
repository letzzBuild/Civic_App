
import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify>  with TickerProviderStateMixin {
     TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text("Notification"),
        bottom:  TabBar(
          controller: _tabController,
          tabs: [
        Tab(
            text: "Incoming"
        ),
         Tab(
            text: "Outgoing"
        )
        ])
        
      ),
         drawer:new Drawer(
       child: ListView(children: [
          Divider(),
         ListTile( 
           onTap: (){
                        Navigator.pushNamed(context, '/officerDashboard');
           },
           title: Text("Home"),
         ),
         Divider(),
         ListTile(
           title: Text("All Complaints"),
            onTap: (){
             Navigator.pushNamed(context, '/officerDashboard/AllComplaints');
           },
         ),
          Divider(),
         ListTile(
           title: Text("Pending Complaints"),
           onTap: (){
             Navigator.pushNamed(context, '/officerDashboard/Pendingcomplaint');
           },
         ),
            Divider(),
         ListTile(
           title: Text("Resolved Issues"),
           onTap: (){
             Navigator.pushNamed(context, '/officerDashboard/Resolvedcomplaint');
           },
         ),
            Divider(),
         ListTile(
           title: Text("Notification"),
             onTap: (){
             Navigator.pushNamed(context, '/officerDashboard/Notification');
           },
         ),
            Divider(),
         ListTile(
           title: Text("Profile"),
        onTap: (){
             Navigator.pushNamed(context, '/officerDashboard/profile');
           },
         ),
       ], )
         ),
      body: TabBarView(
        controller: _tabController,
        children: [
        Container(
          
          padding: const EdgeInsets.all(20),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height:40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Cmpl_Id :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text('')
          ],),
          SizedBox(height:30),
           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Officer :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            Text('')
          ],),
           SizedBox(height:30),
           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('City :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            Text('')
          ],),
           SizedBox(height:30),
           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Message :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            Text('')
          ],)
        ],)
        ),
          Container(
            
          padding: const EdgeInsets.all(20),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height:40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Cmpl_Id :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text('')
          ],),
          SizedBox(height:30),
           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Officer :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            Text('')
          ],),
           SizedBox(height:30),
           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('City :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            Text('')
          ],),
           SizedBox(height:30),
           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Message :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            Text('')
          ],)
        ],)
          ),
      ]),
           
    );
  }
}