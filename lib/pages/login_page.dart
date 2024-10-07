

import 'package:flutter/material.dart';
import 'package:flutter_application_us/nav_bar/bottom_nav_bar.dart';
import 'package:flutter_application_us/pages/register_page.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255), 
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 400, 
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/balloons.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Enter your phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                    ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBar()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      ),
                      child: Text('Login', style: TextStyle(color: Colors.black),),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Not registered yet? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                     
              
                  ],
                ),
              ),
            ),
          ),
          Align(
             alignment: Alignment.bottomCenter,
            child: 
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Forgot password? "),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Restore",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),),
        ],
      ),
    );
  }
  }
