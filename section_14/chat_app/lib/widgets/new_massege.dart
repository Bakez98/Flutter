import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessege extends StatefulWidget {
  const NewMessege({super.key});

  @override
  State<NewMessege> createState() {
    return _NewMessegeState();
  }
}

class _NewMessegeState extends State<NewMessege> {
  var _messegeController = TextEditingController();

  @override
  void dispose() {
    _messegeController.dispose();
    super.dispose();
  }

  void _submitMessege() async {
    final enteredMessege = _messegeController.text;

    if (enteredMessege.trim().isEmpty) {
      return;
    }

    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessege,
      'createdAt': Timestamp.now(),
      'userID': user.uid,
      'username': userData.data()!['username'],
      'userImage': userData.data()!['image_url'],
    });
    _messegeController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 1,
        bottom: 14,
      ),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _messegeController,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration:
                const InputDecoration(label: Text("Send a massage... ")),
          )),
          IconButton(
            onPressed: _submitMessege,
            icon: Icon(Icons.send),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
