import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/widgets/chat_screen.dart';

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
  List<Map<String, dynamic>> suggestions = [];

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Fetch users when the screen initializes
  }

  Future<void> fetchUsers() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    final List<Map<String, dynamic>> fetchedUsers = snapshot.docs.map((doc) {
      return {
        'name': doc['name'] ?? '',
        'email': doc['email'] ?? '',
        'id': doc['id'] ?? '',
        'photo': doc['photo'] ?? '',
      };
    }).toList();

    setState(() {
      users = fetchedUsers;
      filteredUsers = fetchedUsers;
    });
  }

  void filterSearch(String query) {
    suggestions = users.where((user) {
      final userName = user['name']!.toLowerCase();
      final input = query.toLowerCase();
      return userName.contains(input);
    }).toList();

    setState(() {
      filteredUsers = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Users'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: filterSearch,
            ),
          ),
          suggestions.isEmpty
              ? Expanded(child: Center(child: Text('Search for users ...')))
              : Expanded(
                  child: ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = filteredUsers[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: buildIcon(icon: Icons.person),
                        ),
                        title: Text(user['name']!),
                        subtitle: Text(user['email']!),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Add friend logic here
                                log('Add ${user['name']} as a friend');
                              },
                              child: buildIcon(icon: Icons.person_add),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                          receiverId: user['id'].toString(),
                                          name: user['name'].toString(),
                                        )));
                                log('Message ${user['id']}');
                              },
                              child: buildIcon(icon: Icons.message),
                            ),
                          ],
                        ),
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
