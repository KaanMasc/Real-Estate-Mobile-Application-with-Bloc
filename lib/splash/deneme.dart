import 'package:flutter/material.dart';




class RegisterSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register or Sign In'),
      ),
      body: RegisterSignInView(),
    );
  }
}

class RegisterSignInView extends StatefulWidget {
  @override
  _RegisterSignInViewState createState() => _RegisterSignInViewState();
}

class _RegisterSignInViewState extends State<RegisterSignInView> {
  bool isRegisterPage = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isRegisterPage)
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                ),
              ],
            )
          else
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ],
            ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Burada gerekli işlemleri yapabilirsiniz.
              if (isRegisterPage) {
                // Register işlemleri
              } else {
                // Sign In işlemleri
              }
            },
            child: Text(isRegisterPage ? 'Register' : 'Sign In'),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {
              setState(() {
                // Sayfa değişikliğini sağlar
                isRegisterPage = !isRegisterPage;
              });
            },
            child: Text(isRegisterPage
                ? 'Already have an account? Sign In'
                : 'Don\'t have an account? Register'),
          ),
        ],
      ),
    );
  }
}
