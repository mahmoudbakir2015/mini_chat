import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/presentation/views/status/status_body.dart';
import 'package:mini_chat/features/whats/presentation/views/status/widgets/status_floating.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Returns a [Scaffold] widget with a [StatusBody] widget as its body and a
  /// [StatusFloating] widget as its floating action button.
  ///
  /// The [StatusBody] widget is a [StatelessWidget] that displays status of
  /// contacts.
  ///
  /// The [StatusFloating] widget is a [StatelessWidget] that displays a floating
  /// action button with an edit and camera icon. The edit and camera icons are
  /// used to edit and take a picture of the user's status, respectively.
  ///
  /// The [Scaffold] widget returned by this method is the root of the
  /// [MaterialApp] widget tree for the status screen.
  /// ****  2d0715df-3e36-4e58-81f9-9d093c145527  ******
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildStatusBody(),
      floatingActionButton: buildStatusFloating(
        context: context,
        edit: () {},
        camera: () {},
      ),
    );
  }
}
