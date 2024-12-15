import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/chat_screen_view.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  List<Map<String, dynamic>> friends = [];
  String? currentUserId;
  bool isLoading = true; // To show a loading indicator

  @override
  void initState() {
    super.initState();
    fetchCurrentUserId(); // Fetch current user ID on initialization
  }

  // Fetch current user ID
  Future<void> fetchCurrentUserId() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        currentUserId = currentUser.uid;
      });
      fetchFriends(); // Fetch friends after getting the current user ID
    }
  }

  // Fetch friends from Firestore
  Future<void> fetchFriends() async {
    if (currentUserId == null) return;

    try {
      // Query the "friends" collection under the current user
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .collection('friends')
          .get();

      // Retrieve friend details using their IDs
      final List<Map<String, dynamic>> fetchedFriends = [];
      for (var doc in snapshot.docs) {
        final friendId = doc['friendId']; // Get the friend's ID
        final friendInfo = await getUserById(friendId);
        if (friendInfo != null) {
          fetchedFriends.add(friendInfo);
        }
      }

      setState(() {
        friends = fetchedFriends;
        isLoading = false; // Stop showing the loading indicator
      });
    } catch (e) {
      log('Error fetching friends: $e');
      setState(() {
        isLoading = false; // Stop showing the loading indicator on error
      });
    }
  }

  // Retrieve user data by their ID
  Future<Map<String, dynamic>?> getUserById(String userId) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users') // Query the "users" collection
          .doc(userId) // Use the document ID to get the user
          .get();

      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      } else {
        log('User with ID $userId does not exist.');
        return null;
      }
    } catch (e) {
      log('Error fetching user by ID: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Friends'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Loading indicator
          : friends.isEmpty
              ? const Center(
                  child: Text(
                    'No friends found.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ) // Message if no friends
              : ListView.builder(
                  itemCount: friends.length,
                  itemBuilder: (context, index) {
                    final friend = friends[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(friend['photo'] ?? ''),
                      ),
                      title: Text(friend['name'] ?? 'Unknown'),
                      subtitle: Text(friend['email'] ?? 'No Email'),
                      trailing: IconButton(
                        icon: const Icon(Icons.message),
                        onPressed: () {
                          // Navigate to chat screen
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                receiverId: friend['id'],
                                name: friend['name'] ?? 'Unknown',
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
