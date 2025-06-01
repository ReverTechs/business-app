import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CreatePostPage extends StatelessWidget {
  final void Function(bool isVisible)? onScrollBottomBarVisibility;

  const CreatePostPage({Key? key, this.onScrollBottomBarVisibility})
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
            'Create',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              child: const Text(
                'Post',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User profile section
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      'assets/avatar_placeholder.png',
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'blessings chilemba',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Caption input
              TextField(
                controller: _captionController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "Write a caption...",
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 16),
              // Image preview placeholder
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image, size: 60, color: Colors.grey),
                ),
              ),
              //-----------
              TextField(
                controller: _captionController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "Add background cover",
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 16),
              // Image preview placeholder
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image, size: 60, color: Colors.grey),
                ),
              ),

              //-----------
              const SizedBox(height: 16),
              // Add location
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: Colors.grey),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      // Handle add location
                    },
                    child: const Text('Add Location'),
                  ),
                ],
              ),
              const Divider(height: 32),
              // Tag people
              Row(
                children: [
                  const Icon(
                    Icons.person_add_alt_1_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      // Handle tag people
                    },
                    child: const Text('Tag People'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
