import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/features/whats/data/model/user_model.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_cubit.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_states.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/widgets/chat_screen.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    ChatCubit chatCubit = ChatCubit();
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Users'),
      ),
      body: Column(
        children: [
          TextField(
            controller: chatCubit.searchController,
            decoration: InputDecoration(
              labelText: 'Search by name',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (query) {
              chatCubit.query = query;

              // Trigger re-build when the query changes
            },
          ),
          BlocBuilder<ChatCubit, ChatStates>(
            bloc: chatCubit,
            builder: (context, state) => Expanded(
              child: StreamBuilder<List<UserModel>>(
                stream: chatCubit.searchUsers(chatCubit.searchController.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No users found.'));
                  }

                  final users = snapshot.data!;

                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];

                      return ListTile(
                        leading: user.photoUrl.isNotEmpty
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(user.photoUrl))
                            : CircleAvatar(child: Icon(Icons.person)),
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        onTap: () {
                          // Navigate to chat screen with selected user
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                senderId:
                                    'currentUserId', // Replace with the actual current user ID
                                receiverId: user.userId,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
