import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';

import 'center_text_message.dart';
import 'loading.dart';

class FutureBuilderHandling extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final Function() success;
  final (List?, DbException?) data;
  const FutureBuilderHandling({
    super.key,
    required this.snapshot,
    required this.data,
    required this.success,
  });

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Loading();
    }

    if (snapshot.hasError) {
      return CenterTextMessage(snapshot.error.toString());
    }

    if (data.$2 != null || data.$1 == null) {
      return CenterTextMessage(data.$2?.message ?? "Something went wrong");
    }

    if (data.$1!.isEmpty) {
      return const CenterTextMessage("No data found");
    }

    return success();
  }
}
