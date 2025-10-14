import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:ticketfirst/Api/Helper/fetchData.dart";

class UserDataScreen extends ConsumerWidget{
  @override
  Widget build(BuildContext context,WidgetRef ref){
    return Scaffold(
      body: Center(
        child: Card(
          color: Colors.cyanAccent,
          child: GestureDetector(
            onTap: () {
            fetchUser().fetchUserData();
            },
            child: Text("FetchUser Data"),),
        ),),
    );
  }
}