import 'package:chatapp/pages/theme/theme.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _finalpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: const Text('Signup'),
            backgroundColor: Colors.grey.shade600,
            surfaceTintColor: Colors.black,
            elevation: 4,
            titleTextStyle: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              letterSpacing: 2.5,
            ),
            centerTitle: true,
            shadowColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(60, 10),
                bottomRight: Radius.elliptical(60, 10),
              ),
            ),
            leading: const Icon(
              Icons.person_2_outlined,
              size: 30,
              color: Colors.black,
            ) //const Icon(Icons.mark_unread_chat_alt_sharp,textDirection: TextDirection.rtl),
            ),
        body: CustomGradientContainer(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(children: [
                          Material(
                            borderRadius: BorderRadius.circular(25),
                            shadowColor: Colors.white70,
                            color: Colors.white,
                            elevation: 8,
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(width: 2),
                                ),
                                labelText: 'Email Address',
                                hintText: 'Enter your email',
                                prefixIcon: const Icon(Icons.mail_lock_outlined),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Material(
                            borderRadius: BorderRadius.circular(25),
                            shadowColor: Colors.white70,
                            color: Colors.white,
                            elevation: 8,
                            child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(width: 2),
                                ),
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                prefixIcon: const Icon(Icons.password_outlined),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Material(
                            borderRadius: BorderRadius.circular(25),
                            shadowColor: Colors.white70,
                            color: Colors.white,
                            elevation: 8,
                            child: TextField(
                              controller: _finalpasswordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(width: 2),
                                ),
                                labelText: 'Confirm Password',
                                hintText: 'Confirm your password',
                                prefixIcon: const Icon(Icons.password_outlined),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                            ),
                          ),
                        ])),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add your signup logic here
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ));
  }
}
