import 'package:flutter/material.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'No Groups yet __',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
    );
  }
}
