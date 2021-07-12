import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
          title: Text('All Compalints'),
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
              title: Text("Notification"),
              onTap: () {
                Navigator.pushNamed(context, '/officerDashboard/Notification');
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
                  child: AllComplaintsView(),
                ),
              ]),
        ));
  }
}

class AllComplaintsView extends StatefulWidget {
  @override
  _AllComplaintsViewState createState() => _AllComplaintsViewState();
}

var allcomplaintsdata;

class _AllComplaintsViewState extends State<AllComplaintsView> {
  int user_id;
  VlcPlayerController _vlcViewController;
  String streamurl;

  void getlocalstoragedata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      user_id = prefs.get("user_id");
    });
  }

  @override
  void initState() {
    super.initState();
    getlocalstoragedata();
    getallComplaints();
    _vlcViewController = new VlcPlayerController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _vlcViewController.dispose();
  }

  void getallComplaints() async {
    var res = await http.get(
        Uri.http("192.168.43.187:8000",
            "complaints/allcomplaints/officer/${user_id}"),
        headers: <String, String>{
          'Content-Type': 'application/jsone;  charset=UTF-8'
        });
    allcomplaintsdata = jsonDecode(res.body);
    print(allcomplaintsdata);
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allcomplaintsdata.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(
            allcomplaintsdata[index]['comp_title'].toString(),
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
                Text(allcomplaintsdata[index]['comp_title'].toString())
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
                Text(allcomplaintsdata[index]['comp_date'])
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Action Take:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                Text(
                  allcomplaintsdata[index]['action_taken'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),

            SizedBox(height: 20),
            Row(
              children: [
                Text("Image", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Image.network(
                  'http://192.168.43.187:8000' +
                      allcomplaintsdata[4]['comp_image'],
                  width: 300,
                  height: 120,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Video"),
            SizedBox(
              height: 20,
            ),
            streamurl != null
                ? Container(
                    child: new VlcPlayer(
                      defaultHeight: 480,
                      defaultWidth: 640,
                      controller: _vlcViewController,
                      // url:"http://192.168.43.187:8000/media/videos/1571548439460.mp4",
                      url: streamurl,
                      placeholder: Container(),
                    ),
                  )
                : Text('click the play button'),
            SizedBox(height: 5),
            FloatingActionButton(
                child: Icon(streamurl == null ? Icons.play_arrow : Icons.pause),
                onPressed: () {
                  setState(() {
                    if (streamurl == null) {
                      streamurl =
                          "http://192.168.43.187:8000/media/videos/1571548439460.mp4";
                      _vlcViewController.dispose();
                    } else {
                      streamurl = null;
                    }
                  });
                }),
            SizedBox(height: 20),
//      TextButton(
//         style: TextButton.styleFrom(
//                        backgroundColor: Colors.purple[900],
//                         primary: Colors.white,
//                         onSurface: Colors.grey),
//        onPressed: (){
//          return showDialog(
// context:context,
// builder:(BuildContext context){
//   return Dialog(
//     shape: RoundedRectangleBorder(
//                 borderRadius:
//                     BorderRadius.circular(20.0)),

//           child: Container(
//             height: 200,

//             child: Padding(
//               padding: const EdgeInsets.only(top:30,left: 20,),
//               child: SingleChildScrollView(
//                               child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//                       TextField(
//                         keyboardType: TextInputType.text,
//                         maxLines: 2,
//                         decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'Enter Message'),
//                       ),

//                        TextButton(
//                         style: TextButton.styleFrom(
//                        backgroundColor: Colors.purple[900],
//                         primary: Colors.white,
//                         onSurface: Colors.grey),
//                          onPressed:(){

//                        }, child: Text('Submit',style: TextStyle(color: Colors.white,backgroundColor:  Colors.purple[900],),))

//             ],
//           ),
//               ),),)

//   );
// }
//          );
//        }, child: Text('Notify Officer',))
          ],
        );
      },
    );
  }
}
