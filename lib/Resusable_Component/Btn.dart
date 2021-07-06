import 'package:flutter/material.dart';
class Btn extends StatelessWidget {
  Btn({this.text,this.onPress,});
  final String text;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>onPress(),
      //  {
        
      //   // if(formKeylog.currentState.validate()){
      //   // username =_userNameController.text,
      //   // password= _passController.text,
      //   // print(username),
      //   // print(password),
      //   // attemptLogIn(username, password),
      //   // }
      //   // else{
      //   //   print("form is not validated")
      //   // }
      // },
      child: Container(
        // width: MediaQuery.of(context).size.width,
        //
        width: 300,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            color: Colors.purple[900]
            // gradient: LinearGradient(
            //     begin: Alignment.centerLeft,
            //     end: Alignment.centerRight,
            //     colors: [Color(0xb71c1c), Color(0xfff7892b)])
            ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
  }
