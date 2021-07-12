import 'dart:convert';
import 'package:civic_app/Resusable_Component/Btn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String token = "";

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int statevalue;
  int cityvalue;
  String country = "india";
  String role = "citizen";
  String username;
  String email;
  String password;
  bool isloading = false;
  int phone;
  List newstates = [];
  List cities = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getStates();
  }

  Future<String> getStates() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = (pref.get("token"));
    });
    print("getstates");
    var response = await http.get(
      Uri.http("192.168.43.187:8000", "statecity/states/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    setState(() {
      newstates = jsonDecode(response.body);
    });
    return null;
  }

  Future<String> getcities(int state_id) async {
    String endpoint = "statecity/cities/$state_id/";
    print(endpoint);
    var res = await http.get(Uri.http("192.168.43.187:8000", endpoint));
    setState(() {
      cities = jsonDecode(res.body);
    });

    return null;
  }

  void signUpRequest(
      String name, String email, int phone, String password) async {
    var data = jsonEncode({
      "name": name,
      "email": email,
      "phone": phone,
      "country": country,
      "State_id": statevalue.toInt(),
      "city_id": cityvalue.toInt(),
      "password": password,
      "role": role,
    });
    var response = await http.post(
      Uri.http("192.168.43.187:8000", "users/adduser/"),
      body: data,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var signupdata = jsonDecode(response.body);

    if (signupdata['Status'] == 1) {
      Navigator.pushNamed(context, '/login');
    }
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

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

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

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$token"),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Create an account here...",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  _title(),
                  SizedBox(height: 20),
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
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        prefixIcon:
                            Icon(Icons.person, size: 20, color: Colors.black),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Enter you name',
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: TextFormField(
                      validator: validateEmail,
                      controller: _emailController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        prefixIcon:
                            Icon(Icons.email, size: 20, color: Colors.black),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Email',
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: TextFormField(
                      validator: validateMobile,
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        prefixIcon:
                            Icon(Icons.phone, size: 20, color: Colors.black),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Mobile',
                        labelText: 'Mobile',
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
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            initialValue: 'citizen',
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 5,
                          shadowColor: Colors.grey,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 16, 10, 16),
                              border: InputBorder.none,
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "Choose state",
                              fillColor: Colors.white,
                            ),
                            value: statevalue,
                            onChanged: (var value) {
                              setState(() {
                                statevalue = value;
                                print(statevalue);
                                getcities(statevalue);
                              });
                            },
                            items: newstates
                                .map((ele) => DropdownMenuItem(
                                    value: ele['state_id'],
                                    child: Text(ele['state_name'])))
                                .toList(),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Material(
                          elevation: 5,
                          shadowColor: Colors.grey,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 16, 10, 16),
                              border: InputBorder.none,
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "Choose city",
                              fillColor: Colors.white,
                            ),
                            value: cityvalue,
                            onChanged: (var ele) {
                              setState(() {
                                cityvalue = ele;
                                print(cityvalue);
                              });
                            },
                            items: cities
                                .map((item) => DropdownMenuItem(
                                    value: item['city_id'],
                                    child: Text(item['city_name'])))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field is required";
                        }
                        if (value.length < 4) {
                          return 'Must be more than 3 charater';
                        }
                        return null;
                      },
                      controller: _passController,
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
                  SizedBox(height: 40),
                  Btn(
                    text: "SignUp",
                    onPress: () {
                      if (formKey.currentState.validate()) {
                        username = _nameController.text;
                        email = _emailController.text;
                        password = _passController.text;
                        phone = int.parse(_phoneController.text);
                        signUpRequest(username, email, phone, password);
                      }
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
