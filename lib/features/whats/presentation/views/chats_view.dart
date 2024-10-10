import 'package:flutter/material.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: buildTileCardInfo(
              context: context,
              image: '',
              name: 'Mahmoud bakir',
              lastMessage: 'hello',
              time: '12:20 PM',
              notSeen: null,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
    );
  }

  ListTile buildTileCardInfo({
    required BuildContext context,
    required String image,
    required String name,
    required String lastMessage,
    required String time,
    String? notSeen,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.1,
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Text(lastMessage),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(time),
          (notSeen != null)
              ? CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.03,
                  backgroundColor: Colors.green,
                  child: Text(
                    notSeen,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
