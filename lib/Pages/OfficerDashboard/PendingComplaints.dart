import 'package:flutter/material.dart';
class PendingIssue extends StatefulWidget {
  @override
  _PendingIssueState createState() => _PendingIssueState();
}

class _PendingIssueState extends State<PendingIssue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.purple[900],
         title: Text('Pending Issues'),),
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
       body:
      Container(
        padding: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child:PendingView(),
            ),
          ]
      ),
      )
    );
  }
}

class PendingView extends StatefulWidget {
  @override
  _PendingViewState createState() => _PendingViewState();
}

class _PendingViewState extends State<PendingView> {
  @override
  Widget build(BuildContext context) {
    
      final titles=['Title1', 'Title2','Title3'];
    return ListView.builder(
    itemCount:titles.length,
    itemBuilder:(context,index) {
      return ExpansionTile(
   
   title: Text(titles[index],

   
   ),
   children: [
     Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Title :",style: TextStyle(fontWeight: FontWeight.bold),),
           SizedBox(width:20),
         Text("")
       ],
     ),
     SizedBox(height:20),
 Row( mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Complaint Date :",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(width:20),
         Text("10-05-2020")
       ],
     ),
      SizedBox(height:10),
      Row( mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Description:",style: TextStyle(fontWeight: FontWeight.bold),),
           SizedBox(width:20),
        Container(
          padding: EdgeInsets.only(top:30),
          width:150,
          child : Text("Complaint Against the bskjdkdsf fndskhfhkds bjhgjhgsgf city bbs sajg hgsjg ttds", overflow: TextOverflow.ellipsis,maxLines: 10,textAlign: TextAlign.justify,),)
       ],
     ),
      SizedBox(height:20),
      Row( mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Progress:",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(width:20),
         Text("70%")
       ],
     ),
      SizedBox(height:20),
      Row( mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Status:",style: TextStyle(fontWeight: FontWeight.bold),),
           SizedBox(width:20),
         Text("")
       ],
     )

 ],
 );
    },
  );
    
  }
}