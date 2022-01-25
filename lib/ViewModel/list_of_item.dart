import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YourItemList {
  static Widget itemCard(BuildContext context, String itemName, String amount,
      String date, String time) {
    //  String itemName , String amount , String date , String time
    var mq = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: mq.height * 0.01, horizontal: mq.width * .02),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(mq.width * 0.03))),
        child: ListTile(
          title: Text(
            itemName,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
          subtitle: Text(
            "${date} | ${time}",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 15, fontFamily: GoogleFonts.poppins().fontFamily),
          ),
          trailing: Text(
            "\$ $amount",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
        ),
      ),
    );
  }
}
