import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text("Profile"),),
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
              title: Text(" View Complaints"),
              onTap: (){
                Navigator.of(context).pushNamed('/citizenDashboard');
              },
          ), Divider(),
        ],),

      ),
      body: DetailProfile()
      
    );
  }
}

class DetailProfile extends StatefulWidget {
  @override
  _DetailProfileState createState() => _DetailProfileState();
}
String  name;
String email;
int phone;
String country;
String state;
String city;

class _DetailProfileState extends State<DetailProfile> {
  @override
  void initState() { 
    super.initState();
    profiledetails();
    
  }

  Future  profiledetails()async{
    final  SharedPreferences prefs=await SharedPreferences.getInstance();
    name=prefs.get("username");
    email=prefs.get("citizenemail");
    phone=prefs.get("citizenphone");
    country=prefs.get("citizencountry");
    state=prefs.get("citizenState");
    city=prefs.get("citizenCity");


  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
        padding: EdgeInsets.only(top: 20,left:20, right: 20),
        
        child: SingleChildScrollView(child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:40),
          CircleAvatar(
            backgroundColor: Colors.purple[900],
            child: Text(name[0],style: TextStyle(fontSize: 40,color: Colors.white),),
            radius:40,
          ),
          SizedBox(height:30),
     
          Container(
            margin: EdgeInsets.only(left:45),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height:30),
                Row( 
                  children: [
                    
                    Text('Name :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ),
                    SizedBox(width:30),
                    Text('$name'),

                  ],
                ),
                 SizedBox(height:30),
                Row(
                  children: [
                    Text('Email :' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                     SizedBox(width:30),
                Text('$email'),

                  ],
                ),
                 SizedBox(height:30),
                Row(
                  children: [
                    Text('Mobile No :' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                     SizedBox(width:30),
                    Text('$phone'),

                  ],
                ),
                 SizedBox(height:30),
                Row(
                  children: [
                    Text('Country :' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                     SizedBox(width:30),
                    Text('$country'),

                  ],
                ),
                 SizedBox(height:30),
                Row(
                  children: [
                    Text('State :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ),
                     SizedBox(width:30),
                    Text('$state'),

                  ],
                ),
                 SizedBox(height:30),
                Row(
                  children: [
                    Text('City :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                     SizedBox(width:60),
                    Text('$city'),

                  ],
                ),
              ],
            ),
          ),
        ],),)
      );
  }
}