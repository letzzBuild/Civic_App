import 'package:civic_app/Pages/AdminDashboard/AdminHomePage.dart';
import 'package:flutter/material.dart';
import 'package:civic_app/Resusable_Component/Btn.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String dropDownValue;
  List<String> userType = ['Admin', 'Officer'];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Civik"),),
        body: new Container(
            padding: EdgeInsets.only(top: 40, left: 30, right: 20),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back..!",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Pasifico-Regular', 
                              fontSize: 30),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       "Login to continue",
                    //       style: TextStyle(color: Colors.grey, fontSize: 25),
                    //     ),
                    //   ],
                    // ),
                    Image(
                      image: AssetImage('images/log3.png'),
                      width: 300,
                      height: 300,
                      
                    ),
                   
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
                    
                    SizedBox(
                      height: 20.0,
                    ),
                    
                    
                   
                    Material(
                         elevation: 5,
                        shadowColor: Colors.grey,
                        child: DropdownButtonFormField(
                          
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                            border: InputBorder.none,
                            filled: true,
                             prefixIcon: Icon(
                              Icons.arrow_downward_rounded,
                              size: 25,
                              color: Colors.black
                            ),
                            
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Choose UserType",
                            fillColor: Colors.white,
                          ),
                          value: dropDownValue,
                          onChanged: (String value) {
                            setState(() {
                              dropDownValue = value;
                            });
                          },
                          items: userType
                              .map((userType) => DropdownMenuItem(
                                  value: userType, child: Text("$userType")))
                              .toList(),
                        ),
                      ),
                      SizedBox(
                      height: 20.0,
                    ),
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
                     SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "forgot password?",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    
                    SizedBox(height: 25),
                    // _submitButton(),
                    Btn(
                      text:"Login",
                     onPress: (){

                     },

                      
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text("Don't have an account?"),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>AdminHome() ));
                                },
                                child: Container(
                                  child: new Text(
                                    "SIGN UP",
                                    style: TextStyle(color: Colors.purple[900],fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Divider(color:Colors.black ,height: 40,)
                  ],
                ),
              ),
            )));
  }
}
