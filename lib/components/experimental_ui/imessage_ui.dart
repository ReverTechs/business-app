import 'package:business_app/components/experimental_ui/default_placeholer_ui.dart';
import 'package:flutter/material.dart';

// Model for menu items
class MenuItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  MenuItem({required this.title, required this.icon, required this.onTap});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  bool _isMenuVisible = false;
  OverlayEntry? _overlayEntry;
  late AnimationController _animationController;
  late Animation<double> _animation;

  // List of menu items (initially populated)
  final List<MenuItem> _menuItems = [
    MenuItem(
      title: 'Camera',
      icon: Icons.camera_alt,
      onTap: () => print('Camera tapped'),
    ),
    MenuItem(
      title: 'Photos',
      icon: Icons.photo,
      onTap: () => print('Photos tapped'),
    ),
    MenuItem(
      title: 'Stickers',
      icon: Icons.emoji_emotions,
      onTap: () => print('Stickers tapped'),
    ),
    MenuItem(
      title: 'Audio',
      icon: Icons.mic,
      onTap: () => print('Audio tapped'),
    ),
    MenuItem(
      title: 'Location',
      icon: Icons.location_on,
      onTap: () => print('Location tapped'),
    ),
    MenuItem(
      title: 'Videos',
      icon: Icons.videocam,
      onTap: () => print('Video tapped'),
    ),
    MenuItem(
      title: 'Poll',
      icon: Icons.poll,
      // Placeholder for poll functionality
      onTap: () => print('Poll tapped'),
    ),
    MenuItem(
      title: 'Documents',
      icon: Icons.insert_drive_file,
      // Placeholder for poll functionality
      onTap: () => print('Poll tapped'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize animation controller for menu slide-in
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://cdni.pornpics.com/1280/7/725/40669812/40669812_034_2bed.jpg',
              ),
              backgroundColor: Colors.blue,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                "Christina Lungu",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Spacer(),
            // the text was causing overflow issues, so I wrapped the icon in a Row widget
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.call, color: Colors.blue),
                  onPressed: () {
                    // Handle call action
                    print('Call button tapped');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.more_vert_rounded, color: Colors.blue),
                  onPressed: () {
                    // Handle call action
                    print('more button tapped');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(child: DefaultPlaceholderUi()),
          ), // Placeholder for chat messages
          _buildInputArea(),
        ],
      ),
    );
  }

  // Build the input area with text field and plus button
  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      // color: Colors.grey[200],
      color: Colors.transparent,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              _isMenuVisible ? Icons.close : Icons.add_circle_outline,
              size: 30,
              color: Colors.blue,
            ),
            onPressed: () {
              setState(() {
                _isMenuVisible = !_isMenuVisible;
              });
              _toggleMenu();
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Write message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                //fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                print('Message sent: ${_controller.text}');
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }

  // Toggle the menu visibility
  void _toggleMenu() {
    if (_isMenuVisible) {
      _showMenu();
      _animationController.forward();
    } else {
      _animationController.reverse().then((_) => _hideMenu());
    }
  }

  // Show the menu using Overlay
  void _showMenu() {
    _overlayEntry = OverlayEntry(
      builder:
          (context) => GestureDetector(
            onTap: () {
              // Dismiss menu when tapping outside
              setState(() {
                _isMenuVisible = false;
              });
              _toggleMenu();
            },
            child: Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom:
                        MediaQuery.of(context).viewInsets.bottom +
                        60, // Above keyboard
                    child: SizeTransition(
                      sizeFactor: _animation,
                      axisAlignment: -1.0,
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          constraints: const BoxConstraints(maxHeight: 250),
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ReorderableListView(
                            shrinkWrap: true,
                            onReorder: (oldIndex, newIndex) {
                              setState(() {
                                if (newIndex > oldIndex) newIndex--;
                                final item = _menuItems.removeAt(oldIndex);
                                _menuItems.insert(newIndex, item);
                              });
                            },
                            children: [
                              ..._menuItems.asMap().entries.map((entry) {
                                final index = entry.key;
                                final item = entry.value;
                                return ListTile(
                                  key: ValueKey(item.title),
                                  leading: Icon(item.icon, color: Colors.blue),
                                  title: Text(item.title),
                                  onTap: () {
                                    item.onTap();
                                    setState(() {
                                      _isMenuVisible = false;
                                    });
                                    _toggleMenu();
                                  },
                                );
                              }).toList(),
                              ListTile(
                                key: const ValueKey('more'),
                                leading: const Icon(
                                  Icons.more_horiz,
                                  color: Colors.blue,
                                ),
                                title: const Text('More'),
                                onTap: () {
                                  print('More tapped');
                                  // Add logic to show additional apps
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  // Hide the menu
  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    _hideMenu();
    super.dispose();
  }
}
