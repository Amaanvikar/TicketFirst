import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketfirst/Provider/RiverPodProvider.dart';

class EditScreen extends ConsumerWidget{
  @override
  Widget build(BuildContext context,WidgetRef ref){
    final edit = ref.watch(EditProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        actions: [
          IconButton(onPressed: () => ref.read(EditProvider.notifier).state, icon: Icon(Icons.edit))
          
        ]
      
      ),
    );
  }
}