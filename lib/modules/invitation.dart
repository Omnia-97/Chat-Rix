import 'package:chat_app/shared/database/database_utils.dart';
import 'package:flutter/material.dart';

class InviteUserView extends StatefulWidget {
  final String roomId;

  const InviteUserView({Key? key, required this.roomId}) : super(key: key);

  @override
  State<InviteUserView> createState() => _InviteUserViewState();
}

class _InviteUserViewState extends State<InviteUserView> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _inviteUser() async {
    String email = _emailController.text.trim();
    var usersCollection = DataBaseUtils.getUsersCollection();

    // Find user by email
    var querySnapshot = await usersCollection.where('email', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      var userDoc = querySnapshot.docs.first;
      var userId = userDoc.id;

      // Invite the user to the room
      await DataBaseUtils.inviteUserToRoom(widget.roomId, userId);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User invited successfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User not found')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invite User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'User Email',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _inviteUser,
              child: Text('Invite'),
            ),
          ],
        ),
      ),
    );
  }
}
