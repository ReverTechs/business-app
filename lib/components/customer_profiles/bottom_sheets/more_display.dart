import 'package:flutter/material.dart';

// Stateful class for the bottom sheet
class MoreAbout extends StatefulWidget {
  @override
  _MoreAboutState createState() => _MoreAboutState();
}

class _MoreAboutState extends State<MoreAbout> {
  bool _isHidden = false; // Example state for the switch

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top handle bar
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Bottom sheet options
            _buildOption('Block', Colors.red, () {
              Navigator.pop(context);
              // Add block action
            }),
            _buildOption('Report business', Colors.red, () {
              Navigator.pop(context);
              // Add report action
            }),
            // _buildOption('Add', Colors.white, () {
            //   Navigator.pop(context);
            //   // Add add action
            // }),
            _buildOption('Unfollow', Colors.white, () {
              Navigator.pop(context);
              // Add add action
            }),
            _buildOption(
              'Hide this Content',
              Colors.white,
              () {},
              trailing: Switch(
                value: _isHidden,
                onChanged: (value) {
                  setState(() {
                    _isHidden = value;
                  });
                  // Add hide content action
                },
                activeColor: Colors.white,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[800],
              ),
            ),
            _buildOption('About', Colors.white, () {
              Navigator.pop(context);
              // Add recommended action
            }),
            //original code
            /* _buildOption(
              'Send Profile to...',
              Colors.white,
              () {
                Navigator.pop(context);
                // Add send profile action
              },
              trailing: Icon(Icons.send, color: Colors.blue),
            ),
            */
            _buildOption(
              'Send Profile to...',
              Colors.white,
              () {
                Navigator.pop(context);
                // Add send profile action
              },
              trailing: Icon(Icons.send, color: Colors.blue),
            ),
            _buildOption(
              'Copy Business URL',
              //trailing: Icon(Icons.send, color: Colors.blue),
              Colors.white,
              () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.link, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Link copied',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    duration: Duration(seconds: 3),
                  ),
                );
                // Add share URL action
              },
            ),
            /* original code
            _buildOption('Copy Business URL', Colors.white, () {
              Navigator.pop(context);
              // Add share URL action
            }),
            */
            // Done button
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   child: TextButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     child: Text(
            //       'Done',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 16,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each option
  Widget _buildOption(
    String text,
    Color color,
    VoidCallback onTap, {
    Widget? trailing,
  }) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
