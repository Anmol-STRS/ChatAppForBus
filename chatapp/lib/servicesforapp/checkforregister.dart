import 'dart:js_interop';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';

class EmailCollection extends StatefulWidget {
  const EmailCollection({super.key});

  @override
  State<EmailCollection> createState() => _EmailCollectionState();
}

class _EmailCollectionState extends State<EmailCollection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var dbref = FirebaseDatabase.instance.ref().child('Email');
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

String generateRandomEmail() {
  final random = Random();
  final username = String.fromCharCodes(List.generate(
      10, (index) => random.nextInt(26) + 65)); // Generate random username
  return '$username@example.com';
}

Future<void> storeRandomEmail(String email) async {
  // Get a Firestore reference
  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection('random_emails');
  // Add the email document
  await collectionRef.add({'email': email});
}
