import 'package:flutter/material.dart';

class DefaultPlaceholderUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF1A1A1A),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Wrap(
          children: [
            Container(
              width: 300,
              height: 350,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                //color: Color(0xFF2C2C2C),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    //color: Colors.black26,
                    color: Colors.transparent,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://cdni.pornpics.com/1280/7/725/40669812/40669812_034_2bed.jpg', // Replace with a real URL
                    ),
                    backgroundColor: Colors.grey[300],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Christina Lungu',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      //color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle view profile action
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF3A3A3A),
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text('View Business'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Messages and calls are secured with end-to-end encryption. REVER (R) Inc.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14, //color: Colors.grey[400]
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle learn more action
                    },
                    child: Text(
                      'Learn more.',
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
