import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateOfPlans extends StatelessWidget {
  const DateOfPlans({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            size: 36,
            Icons.arrow_left,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
              children: const [
                TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  text: 'Monday, ',
                ),
                TextSpan(
                  text: '26 April',
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            size: 36,
            Icons.arrow_right,
          ),
        ),
      ],
    );
  }
}
