import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

class ChatBubble extends StatefulWidget {
  final String message;
  final String time;
  final bool isMe;

  const ChatBubble(
      {super.key,
      required this.message,
      required this.time,
      required this.isMe});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  bool isEmojiVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9, // Set max width
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: widget.isMe ? AppColor.recieverCardColor : Colors.white,
            borderRadius: widget.isMe
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  widget.message,
                  softWrap: true, // Ensures text wraps to the next line
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  widget.time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const Icon(Icons.check, size: 12, color: Colors.grey),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
