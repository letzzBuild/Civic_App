
import 'dart:convert';

import 'package:civic_app/Resusable_Component/Btn.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
int statevalue=0;
int cityvalue=0;

class Add_Complaints extends StatefulWidget {
  @override
  _Add_ComplaintsState createState() => _Add_ComplaintsState();
}

class _Add_ComplaintsState extends State<Add_Complaints> {

  final _title  =TextEditingController();
  final  _emailController=TextEditingController();
  final _discription =TextEditingController();
  

 @override
 void initState() { 
   super.initState();
   getlocalstoragedata();
 }

 void addcomplaints(String title,String description,String email)async{
   var body=jsonEncode({"title":title,"Description":description,"email":email,"State_id":statevalue,"city_id":cityvalue,});
 final response=await http.post(Uri.http("", ""),headers: <String,String>{
    "AuthUtils.AUTH_HEADER": "_authToken",
    "content-Type":"application/json",
 },body:body ) ; 

 }
  
void getlocalstoragedata()async{
SharedPreferences prefs=await SharedPreferences.getInstance();
setState(() {
  cityvalue= prefs.getInt("city");
  statevalue=prefs.getInt("state");
});
}
  
  
  File _image;
  File _imagepath;
  File _video;
  File _videopath;

  var picker = ImagePicker();


  

  Future getImage() async {
    var  pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imagepath = File(_image.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future <String>  getVideo() async {
    var pickedFile = await picker.getVideo(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);
       
        _videopath = File(_video.path);
      } else {
        print('No video selected.');
      }
    });
    return null;
  }
 String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text("Add Complaints"),
      ),
      drawer: new Drawer(
        child: ListView(
          children: [
            SizedBox(height: 40),
            // IconButton(
            //     icon: Icon(Icons.arrow_back),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     }),
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
              onTap: () {
                Navigator.of(context).pushNamed("/citizenDashboard/profile");
              },
            ),
            Divider(),
            ListTile(
              title: Text("Add Complaints"),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/citizenDashboard/AddComplaints');
              },
            ),
            Divider(),
            ListTile(
              title: Text("View Complaints"),
              onTap: () {
                Navigator.of(context).pushNamed('/citizenDashboard');
              },
            ),
             Divider(),
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Form(

            child:SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Complaints",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 30),
                Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    controller: _title,
                    keyboardType: TextInputType.text,

                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                     
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Title',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    controller: _discription,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,

                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "Description"),
                  ),
                ),
                SizedBox(height: 20),
                
            
                Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    validator: validateEmail ,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                       
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Complaints By",
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "Enter your email address"),
                  ),
                ),
                SizedBox(height: 20),
               Row(
                 children: [
                   Expanded(child: Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    // controller: _userNameController,
                    keyboardType: TextInputType.text,
                    
                          readOnly: true,
                          initialValue: cityvalue.toString(),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                     
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      
                      // hintStyle: TextStyle(color: Colors.grey),
                      // hintText: "City_id",
                    ),
                  ),
                ),
                
                ),
                SizedBox(width:20),
                Expanded(child: Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    // controller: _userNameController,
                    keyboardType: TextInputType.text,

                          readOnly: true,
                          initialValue: statevalue.toString(),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                     
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                   
                    ),
                  ),
                ),)
                 ],
               ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Material(
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
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          initialValue: 'citizen',

                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Material(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        child: TextFormField(
                          
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          initialValue: 'India',

                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(                                            
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        color: Colors.purple[900],
                        onPressed: getImage,
                        child: Text(
                          'Upload Image',
                          style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.purple[900]),
                        ),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                          child: _image == null
                              ? Text('No image selected.')
                              : Text('$_imagepath'))
                  
                      
                    ]),
                    SizedBox(height:20),
                         Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        color: Colors.purple[900],
                        onPressed: getVideo,
                        child: Text(
                          'Upload Video',
                          style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.purple[900]),
                        ),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                          child: _video == null
                              ? Text('No video selected.')
                              : Text('$_videopath'))
                  
                    ]),
                       SizedBox(height: 25),
                      //  TextButton(onPressed:(){

                      //  },style: TextButton.styleFrom(
                      //    primary: Colors.white,
                      //    backgroundColor: Colors.purple[900]
                      //  ), child: Text("Submit"))
                    Btn(
                      text: "Submit",
                      onPress: (){
                        print('hello');
                        String title=_title.text;
                        String description=_discription.text;
                        String email=_emailController.text;
                      
                       
                        addcomplaints(title,description,email);
                      },
                    )
              ],
            ),
          ),
          )),
    );
  }
}
