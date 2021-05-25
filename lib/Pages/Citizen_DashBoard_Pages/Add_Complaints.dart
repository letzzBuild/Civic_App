import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Add_Complaints extends StatefulWidget {
  @override
  _Add_ComplaintsState createState() => _Add_ComplaintsState();
}

class _Add_ComplaintsState extends State<Add_Complaints> {
  String statevalue;
  String cityvalues;
  List<String> state = ['karnataka', 'maharastra'];
  List<String> cities = ['belgaum', 'pune'];
  
  File _image;
  File _imagepath;
  File _video;
  File _videopath;
  final picker = ImagePicker();
  

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imagepath = File(_image.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future getVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);
        _videopath = File(_video.path);
      } else {
        print('No video selected.');
      }
    });
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
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
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
            )
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
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
                    // controller: _userNameController,
                    keyboardType: TextInputType.text,

                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      // prefixIcon: Icon(
                      //   Icons.phone,
                      //   size: 20,
                      //   color: Colors.black
                      // ),
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
                    // controller: _userNameController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,

                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        // prefixIcon: Icon(
                        //   Icons.phone,
                        //   size: 20,
                        //   color: Colors.black
                        // ),
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
                    // controller: _userNameController,
                    keyboardType: TextInputType.text,
                    initialValue: 'India',
                    enabled: false,
                    readOnly: true,

                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      // prefixIcon: Icon(
                      //   Icons.phone,
                      //   size: 20,
                      //   color: Colors.black
                      // ),
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      // hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    // controller: _userNameController,
                    keyboardType: TextInputType.text,

                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        // prefixIcon: Icon(
                        //   Icons.phone,
                        //   size: 20,
                        //   color: Colors.black
                        // ),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "State"),
                  ),
                ),
                SizedBox(height: 20),
                Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    // controller: _userNameController,
                    keyboardType: TextInputType.text,

                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      // prefixIcon: Icon(
                      //   Icons.phone,
                      //   size: 20,
                      //   color: Colors.black
                      // ),
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "City",
                    ),
                  ),
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
                          // controller: _userNameController,
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
                      // TextButton(

                      //   onPressed: () {},
                      //   child: Text(
                      //     'Upload Video',
                      //     style: TextStyle(color: Colors.white,backgroundColor: Colors.purple[900]),
                      //   ),
                      // ),
                    ]),
                    SizedBox(height:20),
                         Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        color: Colors.purple[900],
                        onPressed: getImage,
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
                      // TextButton(

                      //   onPressed: () {},
                      //   child: Text(
                      //     'Upload Video',
                      //     style: TextStyle(color: Colors.white,backgroundColor: Colors.purple[900]),
                      //   ),
                      // ),
                    ]),
              ],
            ),
          )),
    );
  }
}
