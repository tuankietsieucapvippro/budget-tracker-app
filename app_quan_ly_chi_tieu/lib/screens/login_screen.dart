import 'package:app_quan_ly_chi_tieu/screens/signup.dart';
import 'package:app_quan_ly_chi_tieu/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../utils/appvalidator.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoader = false;
  var authService = AuthService();

  Future<void> _submitForm() async {
    if(_formKey.currentState!.validate()){
      setState(() {
        isLoader = true;
      });
      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,

      };
      await authService.login(data, context);
      setState(() {
        isLoader = false;
      });
    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252634),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                  width: 250,
                  child: Text("Login Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:28,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              SizedBox(
                height: 50.0,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration(
                    "Email", Icons.email
                ),
                validator: appValidator.validateEmail,
              ),
              SizedBox(
                height: 16.0,
              ),

              TextFormField(
                controller: _passwordController,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration(
                    "Password", Icons.lock
                ),
                validator: appValidator.validatePassword,
              ),
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: (){
                    isLoader
                        ? print("Loading")
                        : _submitForm();
                  },
                  child: isLoader
                      ? Center(child: CircularProgressIndicator())
                      : Text("Login", style: TextStyle(fontSize: 20),),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => SignUpView()
                        )
                    );
                    },
                  child: Text("Create new account",
                    style:TextStyle(
                        color: Colors.yellow,
                        fontSize: 20
                    ),
                  )
              )

            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon){
    return InputDecoration(
      fillColor: Color(0xAA494A59),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0x35949494)
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white
          )
      ),
      filled: true,
      labelStyle: TextStyle(color: Color(0xFF949494)),
      labelText: label,
      suffixIcon: Icon(suffixIcon, color: Color(0xFF949494),),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
