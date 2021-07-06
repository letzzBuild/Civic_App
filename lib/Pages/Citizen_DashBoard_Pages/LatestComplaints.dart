import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class LatestComplaints extends StatefulWidget {
  @override
  _LatestComplaintsState createState() => _LatestComplaintsState();
}

class _LatestComplaintsState extends State<LatestComplaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.purple[900],
        title: Text("Latest Complaints"),),
      drawer: new Drawer(
        child: ListView(children: [
          
          SizedBox(height:40),
//           IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
//  Navigator.of(context).pop();
//           }),
            Divider(),
          ListTile(
              title: Text("Home"),
              onTap: (){
                Navigator.of(context).pushNamed('/citizenDashboard');
              },
          ),
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
          ),
           Divider(),
          
        ],),
        

      ),
      body: Container(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: LatestView())
        ],
      ),),
    );
  }
}

class LatestView extends StatefulWidget {
  

  @override
  _LatestViewState createState() => _LatestViewState();
}

class _LatestViewState extends State<LatestView> {


   var data;
   @override
   void initState() { 
     super.initState();
        print('hello');
     this.getJsondata();
  
   }
   Future<String> getJsondata()async{
     var response= await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts'),
     
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
     );
     setState(() {
       data=jsonDecode(response.body);
      
     });
      print(data);
   }

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
    itemCount:data==null? 0 :4,//data.lenght()
    itemBuilder:(context,index) {
      return ExpansionTile(
   
   title: Text(data[index]['title'],
   ),
   children: [
     Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Title :",style: TextStyle(fontWeight: FontWeight.bold),),
           SizedBox(width:20),
        Expanded(child:  Text(data[index]['title']))
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
          child : Text(data[index]['body'], overflow: TextOverflow.ellipsis,maxLines: 10,textAlign: TextAlign.justify,),)
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









