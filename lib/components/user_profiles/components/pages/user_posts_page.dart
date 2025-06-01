import 'package:flutter/material.dart';

class UserPostsPage extends StatelessWidget {
  const UserPostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Wrap(
          children: [
            Column(
              children: [
                Text(
                  'No my posts yet __',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
                SizedBox(height: 4),
                Text(
                  'Page under construction ...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
