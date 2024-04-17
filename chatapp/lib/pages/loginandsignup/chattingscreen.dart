import 'dart:developer';

import 'package:chatapp/theme/theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreenMain extends StatefulWidget {
  const ChatScreenMain({super.key});

  @override
  State<ChatScreenMain> createState() => _chatScreenMainState();
}

class _chatScreenMainState extends State<ChatScreenMain> {
  late DatabaseReference _userRef;
  List<Map<dynamic, dynamic>> _users = [];

  @override
  void initState() {
    super.initState();
    _userRef = FirebaseDatabase.instance.ref().child('users');
    _users = [];
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    _userRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        final Map<dynamic, dynamic>? data =
            event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          setState(() {
            _users = data.entries
                .map((e) => e.value as Map<dynamic, dynamic>)
                .toList();
          });
        }
      }
    }, onError: (error) {
      log("Error fetching users: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);
    return Theme(
      data:
          currentTheme.brightness == Brightness.light ? lightTheme : darkTheme,
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text('Chats'),
          titleTextStyle: GoogleFonts.outfit(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2)),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Center(
                child: SizedBox(
              width: 350,
              child: Material(
                borderRadius: BorderRadius.circular(25),
                shadowColor: Colors.white70,
                color: Colors.white,
                elevation: 8,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(width: 2),
                      ),
                      labelText: 'Search for chats',
                      prefixIcon: const Icon(
                        Icons.search,
                        shadows: [
                          Shadow(
                              color: Colors.black,
                              blurRadius: 2,
                              offset: Offset.zero)
                        ],
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.symmetric()),
                ),
              ),
            )),
            Expanded(
                child: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  subtitle: Text(_users[index]['user']),
                  tileColor: Colors.black,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
