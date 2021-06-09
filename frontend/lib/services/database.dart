/*
Author : Ashiqa Rahman
Team :technocrats
National Institute of Technology Warangal
*/
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUsersByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }

  createChatRoom(String chatRoomID, chatRoomMap) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomID)
        .set(chatRoomMap)
        .catchError((e) {
      print(e);
    });
  }

  addConversationMessages(String chatRoomID, messageMap) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomID)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print(e);
    });
  }

  getConversationMessages(String chatRoomID) async {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomID)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  getChatRooms(String userName) async{
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .where("users", arrayContains: userName)
        .snapshots();
  }
}
