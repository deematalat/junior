
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();
      bool isPassword=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
              child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                defaultFormfelid(inputType:TextInputType.emailAddress,
                  controller:emailController,
                  lebel:"Email Address",
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "password must not be empty";
                    }
                    return null;
                  },
                    prefix:Icons.email,
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultFormfelid(
                  isPassword: isPassword,
                  suffix:(
                  isPassword? Icons.visibility:Icons.visibility_off),
                  suffixpresssed: (){
                    setState(() => isPassword =! isPassword); },
                  inputType: TextInputType.visiblePassword,
                  prefix: Icons.lock,

                  validate: (value) {
                    if (value!.isEmpty) {
                      return "password must not be empty";
                    }
                    return null;
                  },
                  controller: passwordcontroller,
                  lebel:"PassWord",

                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultButton(
                    text: "login",
                    function: () {
                      if (formkey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordcontroller.text);
                      }
                    }),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          print("new account");
                        },
                        child: Text("Regstier Now"))
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
