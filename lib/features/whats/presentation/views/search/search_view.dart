import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/chat_screen_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> users = [];
  List<Map<String, dynamic>> filteredUsers = [];
  String? currentUserId;
  Map<String, String> friendRequestStatuses =
      {}; // To track friend request status

  @override
  void initState() {
    super.initState();
    fetchCurrentUserId();
  }

  Future<void> fetchCurrentUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserId = user.uid;
      });
      await fetchUsers(); // Fetch users after obtaining the current user ID
    }
  }

  Future<void> fetchUsers() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();

    final List<Map<String, dynamic>> fetchedUsers = snapshot.docs
        .map((doc) {
          return {
            'name': doc['name'] ?? '',
            'email': doc['email'] ?? '',
            'id': doc.id, // Correct ID field for Firestore
            'photo': doc['photo'] ?? '',
          };
        })
        .where((user) => user['id'] != currentUserId)
        .toList(); // Exclude current user

    for (var user in fetchedUsers) {
      String status = await getFriendRequestStatus(user['id']);
      setState(() {
        friendRequestStatuses[user['id']] = status;
      });
    }

    setState(() {
      users = fetchedUsers;
      filteredUsers = fetchedUsers;
    });
  }

  Future<String> getFriendRequestStatus(String userId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return 'none'; // No request if user is not logged in
    }

    try {
      final friendDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .collection('friends')
          .doc(userId)
          .get();
      if (friendDoc.exists) {
        return 'friend'; // Already a friend
      }

      // Check if there is a pending friend request
      final requestDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('friendRequests')
          .doc(currentUser.uid)
          .get();
      if (requestDoc.exists) {
        return 'pending'; // Friend request is pending
      }

      return 'none'; // No friendship or request yet
    } catch (e) {
      log('Error checking friendship status: $e');
      return 'none';
    }
  }

  void filterSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredUsers = [];
      });
      return;
    }

    final suggestions = users.where((user) {
      final userName = user['name']!.toLowerCase();
      final input = query.toLowerCase();
      return userName.contains(input);
    }).toList();

    setState(() {
      filteredUsers = suggestions;
    });
  }

  Future<void> sendFriendRequest({required String friendId}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final currentUser = auth.currentUser;
    if (currentUser == null) return;

    String senderId = currentUser.uid;

    // Add a friend request to the receiver's document
    await FirebaseFirestore.instance
        .collection('users')
        .doc(friendId)
        .collection('friendRequests')
        .doc(senderId)
        .set({
      'senderId': senderId,
      'timestamp': FieldValue.serverTimestamp(),
    });

    log('Friend request sent to $friendId');

    // Update the request status locally
    setState(() {
      friendRequestStatuses[friendId] = 'pending';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Users'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autocorrect: true,
              controller: searchController,
              decoration: InputDecoration(
                iconColor: AppColor.primaryColor,
                focusColor: AppColor.primaryColor,
                hoverColor: AppColor.primaryColor,
                labelText: 'Search by name',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: filterSearch,
            ),
          ),
          searchController.text.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text(
                      'Start typing to search for users...',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                )
              : filteredUsers.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: Text(
                          'No users found.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = filteredUsers[index];
                          final requestStatus =
                              friendRequestStatuses[user['id']] ?? 'none';

                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(user['photo']!),
                            ),
                            title: Text(user['name']!),
                            subtitle: Text(user['email']!),
                            trailing: requestStatus == 'friend'
                                ? null // No button if they are already friends
                                : ElevatedButton(
                                    onPressed: requestStatus == 'pending'
                                        ? null // Disable if request is pending
                                        : () {
                                            sendFriendRequest(
                                                friendId: user['id']);
                                          },
                                    child: buildIcon(
                                      icon: requestStatus == 'pending'
                                          ? Icons
                                              .hourglass_empty // Pending request icon
                                          : Icons
                                              .person_add, // Default add friend icon
                                    ),
                                  ),
                            onTap: requestStatus == 'friend'
                                ? () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ChatScreen(
                                          receiverId: user['id'].toString(),
                                          name: user['name'].toString(),
                                        ),
                                      ),
                                    );
                                  }
                                : null, // Disable tap for non-friends
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }

  Icon buildIcon({required IconData icon}) {
    return Icon(icon, color: AppColor.primaryColor);
  }
}
