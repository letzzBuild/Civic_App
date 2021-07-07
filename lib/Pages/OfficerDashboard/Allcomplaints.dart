import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AllComplaints extends StatefulWidget {
  @override
  _AllComplaintsState createState() => _AllComplaintsState();
}

class _AllComplaintsState extends State<AllComplaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('All Compalints'),),
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
            Expanded(child:AllComplaintsView(),
            ),
          ]
      ),
      )
    );
  }
}

class AllComplaintsView extends StatefulWidget {
  @override
  _AllComplaintsViewState createState() => _AllComplaintsViewState();
}
var allcomplaintsdata;
class _AllComplaintsViewState extends State<AllComplaintsView> {
  @override
  @override
  void initState() { 
    super.initState();
    getallComplaints();
  }
  void getallComplaints()async{
var res=await http.get(Uri.http("192.168.43.187:8000", "complaints/allcomplaints"),headers: <String,String>{
  'Content-Type':'application/jsone;  charset=UTF-8'
});
 allcomplaintsdata=jsonDecode(res.body);
print(allcomplaintsdata);
  }
  Widget build(BuildContext context) {
     
    return ListView.builder(
    itemCount:allcomplaintsdata.length,
    itemBuilder:(context,index) {
      return ExpansionTile(
   
   title: Text(allcomplaintsdata[index]['comp_title'], ),
   leading: Text(allcomplaintsdata[index]['comp_id'].toString()),
   children: [
     Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Title :",style: TextStyle(fontWeight: FontWeight.bold),),
           SizedBox(width:20),
         Text(allcomplaintsdata[index]['comp_title'])
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
          child : Text(allcomplaintsdata[index]['comp_desc'], overflow: TextOverflow.ellipsis,maxLines: 10,textAlign: TextAlign.justify,),)
       ],
     ),
       SizedBox(height:20),
 Row( mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Address :",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(width:20),
         Text("")
       ],
     ),
      SizedBox(height:20),
      Row( mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("State:",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(width:20),
         Text(allcomplaintsdata[index]['state'])
       ],
     ),
      SizedBox(height:20),
      Row( mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Image:",style: TextStyle(fontWeight: FontWeight.bold),),
           SizedBox(width:20),
        Container(child:    Image(
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPxtY8UbiWl5b4XeBM13orHgoRCFSGha-Nv2Pi8dujjm5gbAeRQVHb3P1DfyumEY2xg6Y&usqp=CAU'),
                      width: 200,
                      height: 200,
                      
        ),)
       ],
     ),
       SizedBox(height:20),
      Row( mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Video:",style: TextStyle(fontWeight: FontWeight.bold),),
           SizedBox(width:20),
        Container(
          width:200,
          height: 200,
          child: Text('Video'),
                      
        )
       ],
     ),
     SizedBox(height:30),
     TextButton(
    
       onPressed: (){
         return showDialog(
context:context,
builder:(BuildContext context){
  return Dialog(
    shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0)),

          child: Container(
            height: 300,
           
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                              child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                      TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 2,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Action Text'),
                      ),
                      
                      TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 3,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Status'),
                      ),
                     
                       TextButton(
                        
                         onPressed:(){

                       }, child: Text('Submit',style: TextStyle(color: Colors.white,backgroundColor: Colors.purple[900]),))

            ],
          ),
              ),),)

  );
}
         );
       }, child: Text('Take Action',style: TextStyle(color: Colors.white,backgroundColor: Colors.purple[900]),))

 ],
 );
    },
  );
  }
}