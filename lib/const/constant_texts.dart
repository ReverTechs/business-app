import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoldText extends StatelessWidget {
  final String text;

  const GoldText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // Set text style using TextStyle inside GoogleFonts
      style: GoogleFonts.pacifico(
        textStyle: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          foreground:
              Paint()
                ..shader = LinearGradient(
                  colors: [Colors.red, Colors.yellow],
                ).createShader(
                  Rect.fromPoints(Offset(80, 20), Offset(200, 20)),
                ),
        ),
      ),
    );
    //  text,
    //   style: TextStyle(
    //     fontSize: 24,
    //     fontWeight: FontWeight.bold,
    //     color: Color(0xFFFFD700), // Gold color
    //   ),
    // );
  }
}
