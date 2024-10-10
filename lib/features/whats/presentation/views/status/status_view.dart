import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/presentation/views/status/status_body.dart';
import 'package:mini_chat/features/whats/presentation/views/status/widgets/status_floating.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
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
