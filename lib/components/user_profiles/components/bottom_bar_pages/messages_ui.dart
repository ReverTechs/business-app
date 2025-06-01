import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MessagesUi extends StatelessWidget {
  final void Function(bool isVisible)? onScrollBottomBarVisibility;

  const MessagesUi({Key? key, this.onScrollBottomBarVisibility})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _captionController = TextEditingController();

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is UserScrollNotification &&
            onScrollBottomBarVisibility != null) {
          if (notification.direction == ScrollDirection.reverse) {
            onScrollBottomBarVisibility!(false);
          } else if (notification.direction == ScrollDirection.forward) {
            onScrollBottomBarVisibility!(true);
          }
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Messages',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Wrap(
              children: [
                Text(
                  "Messages page not yet __",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
