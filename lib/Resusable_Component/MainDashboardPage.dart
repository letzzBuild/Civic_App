import 'package:flutter/material.dart';
import 'package:countup/countup.dart';
class MainDashBoardPage extends StatefulWidget {
  @override
  _MainDashBoardPageState createState() => _MainDashBoardPageState();
}

class _MainDashBoardPageState extends State<MainDashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 60),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          color: Colors.white
                        
                          ),
                      child: Column(
                        children: [
                          Text(
                            "Total \nComplaints",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(height: 10),
                          Countup(
                            begin: 0,
                            end: 50,
                            duration: Duration(seconds: 3),
                            style: TextStyle(
                              color: Colors.purple[900],
                              fontSize: 36,
                            ),
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          color: Colors.white
                       
                          ),
                      child: Column(
                        children: [
                          Text("Total Complaints\n resolved",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(height: 10),
                          Countup(
                            begin: 0,
                            end: 100,
                            duration: Duration(seconds: 4),
                            style: TextStyle(
                                fontSize: 36, color: Colors.purple[900]),
                          ),
                        ],
                      ))
                ],
              ),
               SizedBox(height: 40),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          color: Colors.white
                          // gradient: LinearGradient(
                          //     begin: Alignment.centerLeft,
                          //     end: Alignment.centerRight,
                          //     colors: [Color(0xb71c1c), Color(0xfff7892b)])
                          ),
                      child: Column(
                        children: [
                          Text(
                            "Total\nofficers",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(height: 10),
                          Countup(
                            begin: 0,
                            end: 10,
                            duration: Duration(seconds: 3),
                            style: TextStyle(
                              color: Colors.purple[900],
                              fontSize: 36,
                            ),
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          color: Colors.white
                          // gradient: LinearGradient(
                          //     begin: Alignment.centerLeft,
                          //     end: Alignment.centerRight,
                          //     colors: [Color(0xb71c1c), Color(0xfff7892b)])
                          ),
                      child: Column(
                        children: [
                          Text("Register\n users",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(height: 10),
                          Countup(
                            begin: 0,
                            end: 100,
                            duration: Duration(seconds: 4),
                            style: TextStyle(
                                fontSize: 36, color: Colors.purple[900]),
                          ),
                        ],
                      ))
                ],
              )
            ,SizedBox(height: 40),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          color: Colors.white
                          // gradient: LinearGradient(
                          //     begin: Alignment.centerLeft,
                          //     end: Alignment.centerRight,
                          //     colors: [Color(0xb71c1c), Color(0xfff7892b)])
                          ),
                      child: Column(
                        children: [
                          Text(
                            "Total pending \nissues",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(height: 10),
                          Countup(
                            begin: 0,
                            end: 10,
                            duration: Duration(seconds: 3),
                            style: TextStyle(
                              color: Colors.purple[900],
                              fontSize: 36,
                            ),
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          color: Colors.white
                          // gradient: LinearGradient(
                          //     begin: Alignment.centerLeft,
                          //     end: Alignment.centerRight,
                          //     colors: [Color(0xb71c1c), Color(0xfff7892b)])
                          ),
                      child: Column(
                        children: [
                          Text("Total cities\n connected",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(height: 10),
                          Countup(
                            begin: 0,
                            end: 26,
                            duration: Duration(seconds: 4),
                            style: TextStyle(
                                fontSize: 36, color: Colors.purple[900]),
                          ),
                        ],
                      ))
                ],
              )
            ],
          ),
        );
}
}