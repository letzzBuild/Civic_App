import 'package:flutter/material.dart';
class Complaints extends StatefulWidget {
  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple[900],
     title: Text('Complaints'),),

     drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 40),
            new Divider(),
            new ListTile(
              title: new Text(
                'Home',
              ),
                onTap: (){
                Navigator.pushNamed(context, '/Admin/Home');
              },
            ),
            Divider(),
            new ListTile(
              title: new Text(
                'Add officer',
              ),
              onTap: (){
                Navigator.pushNamed(context, '/Admin/addofficer');
              },
            ),
            Divider(),
            new ListTile(
              title: new Text(
                'Delete Officer',
              ),
               onTap: (){
                Navigator.pushNamed(context, '/Admin/removeofficer');
              },
            ),
            // Divider(),
            // new ListTile(
            //   title: new Text("Notifications"),
            //   onTap: (){
            //     Navigator.pushNamed(context, '/Admin/Notification');
            //   },
            // ),
            
            Divider(),
            new ListTile(
              title: new Text(
                'Users',
              ),
               onTap: (){
                Navigator.pushNamed(context, '/Admin/citizen');
              },
            ),
            Divider(),
            new ListTile(
              title: new Text(
                'Complaints',
              ),
              onTap: (){
                Navigator.pushNamed(context, '/Admin/Complaints');
              },
            ),
            new Divider(),
          ],
        ),
      ),
     body:  Container(
        padding: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child:ComplaintView(),
            ),
          ]
      ),
      ),
      
    );
  }
}

class ComplaintView extends StatefulWidget {
  @override
  _ComplaintViewState createState() => _ComplaintViewState();
}

class _ComplaintViewState extends State<ComplaintView> {
  @override
  Widget build(BuildContext context) {
      final titles=['Compl_id1', 'Compl_id2','Compl_id3'];
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
         Text("Action Take:",style: TextStyle(fontWeight: FontWeight.bold),),
           SizedBox(width:20),
        Container(
          padding: EdgeInsets.only(top:30),
          width:150,
          child : Text("Complaint Against the city", overflow: TextOverflow.ellipsis,maxLines: 10,textAlign: TextAlign.justify,),)
       ],
     ),
      SizedBox(height:20),
      Row( mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Officer Name:",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(width:20),
         Text("")
       ],
     ),
      SizedBox(height:20),
     TextButton(
        style: TextButton.styleFrom(
                       backgroundColor: Colors.purple[900],
                        primary: Colors.white,
                        onSurface: Colors.grey),
       onPressed: (){
         return showDialog(
context:context,
builder:(BuildContext context){
  return Dialog(
    shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0)),

          child: Container(
            height: 200,
           
            child: Padding(
              padding: const EdgeInsets.only(top:30,left: 20,),
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
                            hintText: 'Enter Message'),
                      ),
                      
                     
                       TextButton(
                        style: TextButton.styleFrom(
                       backgroundColor: Colors.purple[900],
                        primary: Colors.white,
                        onSurface: Colors.grey),
                         onPressed:(){

                       }, child: Text('Submit',style: TextStyle(color: Colors.white,backgroundColor:  Colors.purple[900],),))

            ],
          ),
              ),),)

  );
}
         );
       }, child: Text('Notify Officer',))


 ],
 );
    },
  );
  }
}