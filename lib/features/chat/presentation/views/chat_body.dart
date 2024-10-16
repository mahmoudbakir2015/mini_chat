import 'package:flutter/material.dart';
import 'package:mini_chat/features/chat/presentation/views/widgets/build_message.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child:
            // StreamBuilder<DocumentSnapshot>(
            //     stream: FirebaseFirestore.instance
            //         .collection('chats')
            //         .doc(widget.senderId)
            //         .collection('chats')
            //         .doc(widget.reciverId)
            //         .snapshots(),
            //     builder: (context, snapshot) {
            //       // if (snapshot.connectionState == ConnectionState.waiting) {
            //       //   return buildCheckNet(text: 'Waiting Internet.....');
            //       // } else if (snapshot.connectionState !=
            //       //     ConnectionState.done) {
            //       //   return buildCheckNet(
            //       //       text: 'No Internet Check You Internet.....');
            //       // }
            //       if (snapshot.hasError) {
            //         return const Center(
            //           child: Text("SomeThing error....."),
            //         );
            //       } else if (!snapshot.hasData) {
            //         return const Center(
            //           child: Text("No Message Yet"),
            //         );
            //       } else if (snapshot.hasData) {
            //         var data = snapshot.data?.data() as Map<String, dynamic>?;
            //         List<dynamic> messages = data?['messages'] ?? [];
            //         return
            Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) {
              // var message = messages[index];
              return const ChatBubble(
                isMe: true,
                message: 'djijfjdf',
                time: '14:37',
              );

              //     // isMe: (message['senderId'] == widget.senderId),
              //     // message: message['text'],
              //     // context: context,
              //     // date: message['date'],
              //     );
            },
            itemCount: 10,
          ),
        ),
        //           } else {
        //             return const Center(
        //               child: Text("SomeThing error  ....."),
        //             );
        //           }
        //         }),
        //   ),
        // ),

        //     );
        //   },
        // ),
      ),
    );
  }
}
