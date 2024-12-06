import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_cubit.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/widgets/chat_screen.dart';

ChatCubit chatCubit = ChatCubit();
StreamBuilder<List<Map<String, dynamic>>> buildBodyOfListOfChat() {
  return StreamBuilder<List<Map<String, dynamic>>>(
    stream: chatCubit.getChats(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasError) {
        return const Center(child: Text('Error loading chats'));
      }

      final chats = snapshot.data ?? [];

      if (chats.isEmpty) {
        return const Center(child: Text('No chats available'));
      }

      return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          final receiverId = chat['receiverId'];
          final lastMessage = chat['lastMessage'];

          return FutureBuilder(
            future: chatCubit.getUserdata(receiverId), // Fetch the user's name
            builder: (context, nameSnapshot) {
              if (nameSnapshot.connectionState == ConnectionState.waiting) {
                return const ListTile(
                  title: Text('Loading...'),
                );
              }

              if (nameSnapshot.hasError) {
                return const ListTile(
                  title: Text('Error loading name'),
                );
              }

              final receiverName = nameSnapshot.data!['name'] ?? 'Unknown';
              final receiverPhoto = nameSnapshot.data!['photo'] ?? 'Unknown';

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(receiverPhoto),
                ),
                title: Text(receiverName), // Display the receiver's name
                subtitle: Text(lastMessage),
                onTap: () {
                  // Navigate to ChatScreen for the selected chat
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        receiverId: receiverId,
                        name: receiverName, // Pass the receiver's name
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      );
    },
  );
}
