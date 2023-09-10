import 'package:chat_app/widgets/chat_masseges.dart';
import 'package:chat_app/widgets/new_massege.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    // final notificationSettings = await fcm.requestPermission();
    final token = await fcm.getToken();
    fcm.subscribeToTopic('chat');
    // print("below is the token");
    // print(
    //     token); // you could send this token (via HTTP or the Firestore sdk) to a backend
  }

  @override
  void initState() {
    super.initState();
    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Chat"),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.primary,
                ))
          ],
          //192.168.1.170
        ),
        body: const Column(
          children: [
            Expanded(
              child: ChatMesseges(),
            ),
            NewMessege(),
          ],
        ));
  }
}
