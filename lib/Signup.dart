import 'package:civic_app/Resusable_Component/btn.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String statevalue;
  String cityvalues;
   List<String> state= ['karnataka', 'maharastra'];
   List<String> cities= ['belgaum', 'pune'];
   

Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: 'S',
            style: TextStyle(
                color: Colors.purple[900],
                fontWeight: FontWeight.bold,
                fontSize: 60)),
        TextSpan(
            text: 'ign', style: TextStyle(color: Colors.black, fontSize: 40)),
        TextSpan(
          text: 'u',
          style: TextStyle(
              color: Colors.purple[900],
              fontWeight: FontWeight.bold,
              fontSize: 40),
        ),
        TextSpan(
          text: 'p',
          style: TextStyle(color: Colors.purple[900], fontSize: 30),
        ),
        TextSpan(
          text: '?',
          style: TextStyle(color: Colors.purple[900], fontSize: 50),
        ),
        TextSpan(
          text: '?',
          style: TextStyle(color: Colors.purple[900], fontSize: 30),
        ),
        TextSpan(
          text: '?',
          style: TextStyle(color: Colors.purple[900], fontSize: 20),
        ),
      ]),
    );
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child:Form(child: SingleChildScrollView(child: Column
        (mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:80),
           Row(mainAxisAlignment: MainAxisAlignment.start,children: [
              Text("Welcome!",style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold),),
            
           ],),
                
            Row(mainAxisAlignment: MainAxisAlignment.start,children: [
              
            Text("Create an account here...",style: TextStyle(fontSize: 20,),),
           ],),
               SizedBox(height:60),
             _title(),
            SizedBox(height:20),
        
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
                            
                             contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            prefixIcon: Icon(
                              Icons.person,
                              size: 20,
                              color: Colors.black
                            ),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Enter you name',
                             
                            labelText: 'Name',
                          ),
                        ),
                      ),
                      SizedBox(height:20),
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
                            
                             contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            prefixIcon: Icon(
                              Icons.email,
                              size: 20,
                              color: Colors.black
                            ),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Email',
                            
                             
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      SizedBox(height:20),
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
                            
                             contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            prefixIcon: Icon(
                              Icons.phone,
                              size: 20,
                              color: Colors.black
                            ),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Mobile',
                             
                            labelText: 'Mobile',
                          ),
                        ),
                      ),
                      SizedBox(height:20),
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
                             contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            
                          
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
                      SizedBox(height:20),
                      Row(
                        children: [
                        Expanded(child:   Material(
                         elevation: 5,
                        shadowColor: Colors.grey,
                        child: DropdownButtonFormField(
                          
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 16, 10, 16),
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
                      SizedBox(height:20),
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
                             contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 20,
                              color: Colors.black,
                            ),
                          
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
                       text:"SignUp",
                       onPress: (){
                         
                       },
                     )




        ],),),)
      ),
      
    );
  }
}