import 'package:chatapp/services/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class MessageService {
  Future<void> sendMessage(String receiverID, message) async {
    final String currentUserID = _auth.currentUser!.uid;
    final String? currentEmail = _auth.currentUser!.email;
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        senderID: currentUserID,
        senderEmail: currentEmail.toString(),
        recieverID: receiverID,
        message: message,
        timestamp: timestamp);

    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    await _firestore
        .collection("chat_room")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

//getting the message
Stream<QuerySnapshot> getMessage(String userID, receiverUserID){
    List<String> ids = [userID, receiverUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore
        .collection("chat_room")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false).snapshots();
}
}
