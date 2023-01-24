import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login",
                  style: TextStyle(fontSize: 40.0,
                  ),
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    print(value);
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),

                ),
                SizedBox(height: 15.0,),
                TextFormField(
                  obscureText: true,
                  controller: passwordcontroller,
                  onChanged: (value) {
                    print(value);
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.remove_red_eye),
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),

                ),
                SizedBox(height: 15.0,),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: MaterialButton(onPressed: () {
                    print(emailController.text);
                    print(passwordcontroller.text);
                  }, child: Text("Login", style: TextStyle(
                    color: Colors.white,
                  ),),
                  ),),
                SizedBox(height: 15.0,),
                Row(
                  children: [
                    Text("Don't have an account?"),
                    TextButton(onPressed: () {
                      print("new account");
                    }, child: Text("Regstier Now"))

                  ],
                )
              ],

            ),
          ),
        ),
      ),
    );
  }


}