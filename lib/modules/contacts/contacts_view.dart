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

    // Find user by email
    var user = await DataBaseUtils.getUserByEmail(email);
    if (user != null) {
      // Add the user directly to the room
      await DataBaseUtils.addUserToRoom(widget.roomId, user.id);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User added to room successfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User not found')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User to Room'),
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
              child: Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
}
