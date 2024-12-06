import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FriendRequestsScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FriendRequestsScreen({super.key});

  Future<void> handleRequest(String senderId, bool isAccepted) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;

    String receiverId = currentUser.uid;

    if (isAccepted) {
      // Add the friend to both users' friends collections
      await FirebaseFirestore.instance
          .collection('users')
          .doc(receiverId)
          .collection('friends')
          .doc(senderId)
          .set({
        'friendId': senderId,
        'timestamp': FieldValue.serverTimestamp()
      });

      await FirebaseFirestore.instance
          .collection('users')
          .doc(senderId)
          .collection('friends')
          .doc(receiverId)
          .set({
        'friendId': receiverId,
        'timestamp': FieldValue.serverTimestamp()
      });
    }

    // Remove the friend request
    await FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('friendRequests')
        .doc(senderId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend Requests'),
        backgroundColor: Colors.teal[800],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .collection('friendRequests')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final requests = snapshot.data!.docs;

          if (requests.isEmpty) {
            return Center(child: Text('No Friend Requests'));
          }

          return ListView.builder(
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              final senderId = request.id;

              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(senderId)
                    .get(),
                builder: (context, userSnapshot) {
                  if (!userSnapshot.hasData) {
                    return ListTile(title: Text('Loading...'));
                  }

                  final userData =
                      userSnapshot.data!.data() as Map<String, dynamic>;

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: userData['photo'] != null
                          ? NetworkImage(userData['photo'])
                          : null,
                      child:
                          userData['photo'] == null ? Icon(Icons.person) : null,
                    ),
                    title: Text(userData['name'] ?? 'Unknown User'),
                    subtitle: Text('Sent you a friend request'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.check, color: Colors.green),
                          onPressed: () => handleRequest(senderId, true),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () => handleRequest(senderId, false),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
