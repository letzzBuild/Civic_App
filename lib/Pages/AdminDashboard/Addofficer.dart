import 'package:flutter/material.dart';
import 'package:civic_app/Resusable_Component/btn.dart';

class Addofficer extends StatefulWidget {
  @override
  _AddofficerState createState() => _AddofficerState();
}

class _AddofficerState extends State<Addofficer> {
   String statevalue;
  String cityvalues;
   List<String> state= ['karnataka', 'maharastra'];
   List<String> cities= ['belgaum', 'pune'];
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('Add Officers'),
      ),
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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:30),
              Text('Add officer',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
              SizedBox(height:40),
        
             Material(
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

                          decoration: const InputDecoration(
                            
                             contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                            
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Enter you name',
                             
                            labelText: 'Name',
                          ),
                        ),
                      ),
                      SizedBox(height:30),
                      Material(
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

                          decoration: const InputDecoration(
                            
                             contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                           
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Email',
                            
                             
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      SizedBox(height:30),
                      Material(
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

                          decoration: const InputDecoration(
                            
                             contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                            
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Mobile',
                             
                            labelText: 'Mobile',
                          ),
                        ),
                      ),
                      SizedBox(height:30),
                     Row(
                        children: [
                        Expanded(child:   Material(
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
                             contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                            
                          
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                          
                            
                            
                          ),
                        ),
                          ),),
                          SizedBox(width:20),
                           Expanded(child:   Material(
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
                          ),)
                          
                        ],
                      ),
                      SizedBox(height:30),
                      Row(
                        children: [
                        Expanded(child:   Material(
                         elevation: 5,
                        shadowColor: Colors.grey,
                        child: DropdownButtonFormField(
                          
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 16, 10, 16),
                            border: InputBorder.none,
                            filled: true,
                            
                            
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Choose state",
                            fillColor: Colors.white,
                          ),
                          value: statevalue,
                          onChanged: (String  value){
                            setState(() {
                              statevalue=value;
                            });
                          },
                          
                          items: state
                              .map((state) => DropdownMenuItem(
                                  value: state, child: Text("$state")))
                              .toList(),
                        ),
                      ),
                          ),
                          SizedBox(width:20),
                           Expanded(child:  Material(
                         elevation: 5,
                        shadowColor: Colors.grey,
                        child: DropdownButtonFormField(
                          
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                            border: InputBorder.none,
                            filled: true,
                             
                            
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Choose city",
                            fillColor: Colors.white,
                          ),
                          value: statevalue,
                          onChanged: (String  value){
                            setState(() {
                              cityvalues=value;
                            });
                          },
                          
                          items: state
                              .map((cities) => DropdownMenuItem(
                                  value: cities, child: Text("$cities")))
                              .toList(),
                        ),
                      ),)
                          
                        ],
                      ),
                      SizedBox(height:30),
                      Material(
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
obscureText: true,
                          decoration: const InputDecoration(
                             contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                            
                          
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'password',
                             hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'password',
                          ),
                        ),
                      ),
                      SizedBox(height:40),
                     Btn(
                       text:"Submit",
                       onPress: (){
                         
                       },
                     )
            ],
          ),
        )),
      ),
    );
  }
}
