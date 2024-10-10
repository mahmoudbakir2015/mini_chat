import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/presentation/views/status/widgets/my_status.dart';
import 'package:mini_chat/features/whats/presentation/views/status/widgets/other_status.dart';
import 'package:mini_chat/features/whats/presentation/views/status/widgets/text_light.dart';

SingleChildScrollView buildStatusBody() {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildMyStatus(
          image: 'https://via.placeholder.com/150',
          onTap: () {},
        ),
        buildTextLight(text: 'Recent Updates'),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return buildOtherStatus(
              image: 'https://via.placeholder.com/150',
              name: 'Kristin Watson',
              time: '3 hours ago',
              onTap: () {},
              isViewed: false,
            );
          },
        ),
        buildTextLight(text: 'Viewed Updates'),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return buildOtherStatus(
              image: 'https://via.placeholder.com/150',
              name: 'Kristin Watson',
              time: '3 hours ago',
              onTap: () {},
              isViewed: true,
            );
          },
        ),
      ],
    ),
  );
}
