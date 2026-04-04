import 'package:auth_example/models/request_models/login_model.dart';
import 'package:auth_example/services/auth_service.dart';
import 'package:auth_example/views/profile_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
                controller: username,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                controller: password,
              ),
              SizedBox(height: 40),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        isLoading = true;
                        setState(() {});
                        bool isLogged = await AuthService().login(
                          loginInfo: LoginModel(
                            username: username.text,
                            password: password.text,
                          ),
                        );
                        if (isLogged) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileView(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "please check yor infromation and try again",
                              ),
                            ),
                          );
                          isLoading = false;
                          setState(() {});
                        }
                      },
                      child: Text("Login"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
