import 'package:flutter/material.dart';
import 'package:mini_chat/core/constants/app_assets.dart';
import 'package:mini_chat/features/whats/presentation/views/status/widgets/my_status.dart';
import 'package:mini_chat/features/whats/presentation/views/status/widgets/other_status.dart';
import 'package:mini_chat/features/whats/presentation/views/status/widgets/text_light.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A function to build a [SingleChildScrollView] that displays a status body.
///
/// The [SingleChildScrollView] contains a [Column] widget with children that are
/// stacked vertically. The [Column] widget is centered horizontally and
/// vertically in the parent [SingleChildScrollView].
///
/// The [children] of the [Column] are a [buildMyStatus] widget, a [buildTextLight]
/// widget with 'Recent Updates' as its text, a [ListView.builder] widget that
/// displays 5 [buildOtherStatus] widgets with [isViewed] set to false, a
/// [buildTextLight] widget with 'Viewed Updates' as its text, and another
/// [ListView.builder] widget that displays 5 [buildOtherStatus] widgets with
/// [isViewed] set to true.
///
/// The [SingleChildScrollView] returned by this method is the body of the
/// [Scaffold] widget for the status screen.
///
/// ****  9abd6756-3c9b-4966-a7ea-342ca72732bd  ******
SingleChildScrollView buildStatusBody() {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildMyStatus(
          image: AppAssets.imageTest,
          onTap: () {},
        ),
        buildTextLight(text: 'Recent Updates'),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return buildOtherStatus(
              image: AppAssets.imageTest,
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
              image: AppAssets.imageTest,
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
