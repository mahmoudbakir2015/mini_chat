// import 'dart:developer';

// import 'package:flutter/Material.dart';
// import 'package:mini_chat/core/theme/app_color.dart';
// import 'package:mini_chat/features/whats/data/model/message_model.dart';
// import 'package:mini_chat/features/whats/data/view_model/chat_cubit.dart';

// buildAppBar({
//   required BuildContext context,
//   required String image,
//   required String name,
// }) {
//   return AppBar(
//     titleSpacing: 0,
//     leading: IconButton(
//         icon: const Icon(
//           Icons.arrow_back_ios,
//           color: Color(0xff191919),
//         ),
//         onPressed: () {
//           Navigator.pop(context);
//         }),
//     backgroundColor: Colors.white,
//     elevation: 0,
//     title: Row(
//       children: [
//         CircleAvatar(
//           backgroundImage: NetworkImage(image),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8),
//           child: Text(
//             name,
//             style: const TextStyle(color: Colors.black),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// buildRecievedMessage(MessageModel messageModel, {required String img}) {
//   return Row(
//     children: [
//       const CircleAvatar(
//         radius: 15,
//         // backgroundImage: NetworkImage(driverImage),
//       ),
//       const SizedBox(
//         width: 10,
//       ),
//       Expanded(
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Container(
//                 padding: const EdgeInsets.all(7),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadiusDirectional.only(
//                     topEnd: Radius.circular(
//                       20,
//                     ),
//                     topStart: Radius.circular(
//                       20,
//                     ),
//                     bottomEnd: Radius.circular(
//                       20,
//                     ),
//                   ),
//                 ),
//                 child: Text(
//                   messageModel.text!,
//                   style: TextStyle(color: Colors.black, fontSize: 14),
//                 ),
//               ),
//             ),
//             Text(
//               messageModel.dateTime!,
//               style: TextStyle(color: Colors.grey, fontSize: 10),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

// buildSenderMessage(MessageModel messageModel) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.end,
//     children: [
//       Align(
//         alignment: Alignment.centerRight,
//         child: Container(
//           padding: const EdgeInsets.all(7),
//           decoration: BoxDecoration(
//             color: Colors.indigo[300],
//             borderRadius: BorderRadiusDirectional.only(
//               topEnd: Radius.circular(
//                 20,
//               ),
//               topStart: Radius.circular(
//                 20,
//               ),
//               bottomStart: Radius.circular(
//                 20,
//               ),
//             ),
//           ),
//           child: Text(messageModel.text!,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               )),
//         ),
//       ),
//       Text(
//         messageModel.dateTime!,
//         style: TextStyle(color: Colors.grey, fontSize: 10),
//       ),
//     ],
//   );
// }

// buildFooter({
//   required String receiverId,
//   required BuildContext context,
//   required TextEditingController controller,
// }) {
//   return Container(
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     height: 40,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Row(
//       children: [
//         Expanded(
//           child: TextFormField(
//             controller: controller,
//             decoration: const InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               border: OutlineInputBorder(),
//               hintText: "Write Your message",
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         InkWell(
//           onTap: () {
//             if (controller.text != '') {
//               ChatCubit.get(context).sendMessage(
//                 recieverId: receiverId,
//                 text: controller.text,

//                 // receiverId: receiverId,
//               );
//               log('sended');
//               controller.text = '';
//             }
//           },
//           child: Container(
//             height: 40,
//             width: 40,
//             decoration: BoxDecoration(
//               color: AppColor.primaryColor,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: const Icon(
//               Icons.send,
//               size: 20,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
