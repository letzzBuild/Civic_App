import 'package:flutter/material.dart';
 class ViewComplaints extends StatefulWidget {
   @override
   _ViewComplaintsState createState() => _ViewComplaintsState();
 }
 
 class _ViewComplaintsState extends State<ViewComplaints> {
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
                Navigator.of(context).pushNamed('/citizenDashboard/ViewComplaints');
              },
          )
        ],),

      ),
      body:
       Container(
        padding: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child:MyDyanamicView(),
            ),
          ]
      ),
      )
    );
   }
 }

 
class MyDyanamicView extends StatefulWidget {
  @override
  _MyDyanamicViewState createState() => _MyDyanamicViewState();
}

class _MyDyanamicViewState extends State<MyDyanamicView> {
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