import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketfirst/Provider/riverPodProvider.dart';

class EditScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final edit = ref.watch(editProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        actions: [
          IconButton(
            onPressed: () => ref.read(editProvider.notifier).state,
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
