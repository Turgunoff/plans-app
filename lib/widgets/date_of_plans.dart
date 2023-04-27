import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateOfPlans extends StatelessWidget {
  final Function chooseDate;
  final Function() previousDate;
  final Function() nextDate;
  final DateTime appointedDay;

  const DateOfPlans(
      this.chooseDate, this.appointedDay, this.previousDate, this.nextDate,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: previousDate,
          icon: const Icon(
            size: 36,
            Icons.arrow_left,
          ),
        ),
        TextButton(
          onPressed: () {
            chooseDate(context);
          },
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
              children: [
                TextSpan(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  text: "${DateFormat.EEEE().format(appointedDay)},  ",
                ),
                TextSpan(
                  text: DateFormat("d MMMM").format(appointedDay),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: nextDate,
          icon: const Icon(
            size: 36,
            Icons.arrow_right,
          ),
        ),
      ],
    );
  }
}
