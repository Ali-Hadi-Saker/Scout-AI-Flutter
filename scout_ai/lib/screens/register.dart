import 'package:flutter/material.dart';
import 'package:scout_ai/widgets/inputField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPasswrod = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(    
        
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/car3.jpg"),
                  fit: BoxFit.cover)
              ),
            ),
            Container(
              
              color: Colors.black.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputField(
                  hintText: "Full Name", 
                  controller: fname,
                  icon: Icons.person,
                  obscureText: false,),            
                InputField(
                  hintText: "Email", 
                  controller: email,
                  icon: Icons.email,
                  obscureText: false,),
                InputField(
                  hintText: "Password", 
                  controller: password,
                  icon: Icons.lock_rounded,
                  obscureText: true,),
                  InputField(
                  hintText: "Confirm Password", 
                  controller: confirmPasswrod,
                  icon: Icons.lock_rounded,
                  obscureText: true,),
                  const Text("Already have an account?",
                  style: TextStyle(color: Colors.white),)]
                  
                        ),
            ),
          ]
        ),
      
      
    );
  }
}
