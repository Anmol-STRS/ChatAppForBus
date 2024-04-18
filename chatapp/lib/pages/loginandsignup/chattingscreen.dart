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
  final DatabaseReference _user =
      FirebaseDatabase.instance.ref('Database').child('user');
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
              child: StreamBuilder<DatabaseEvent>(
                stream: FirebaseDatabase.instance
                    .ref('Database')    
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  DataSnapshot dataSnapshot = snapshot.data!.snapshot;
                  if (!dataSnapshot.exists) {
                    return Text('No data available');
                  }
                  Map<dynamic, dynamic> users = dataSnapshot.value as Map<dynamic, dynamic>;
                  List<dynamic> userList = users.values.toList();
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      final userData = userList[index];
                      final userName = userData['user'] as String;
                      return ListTile(
                        title: Text(userName),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
