import 'dart:async';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final databaseref = FirebaseDatabase.instance.ref();

void addData(String? user, String? password, TextEditingController controller) {
  databaseref
      .child("Database")
      .push()
      .set({'user': user, 'password': password});
  controller.clear();
}

Future<void> readData() async {
  try {
    DatabaseEvent event = await databaseref.child("Database").once();
    DataSnapshot snapshot = event.snapshot;

    Map<dynamic, dynamic>? data = snapshot.value as Map<dynamic, dynamic>?;

    if (data != null) {
      data.forEach((key, value) {
        log("Key: $key, Value: $value");
      });
    } else {
      log("No data found.");
    }
  } catch (e) {
    log("Error reading data: $e");
  }
}