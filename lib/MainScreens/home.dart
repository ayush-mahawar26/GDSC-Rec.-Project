import 'package:flutter/material.dart';
import 'package:gdsc_project/MainScreens/item_add_scr.dart';
import 'package:gdsc_project/ViewModel/list_of_item.dart';
import 'package:gdsc_project/model/list_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({Key? key}) : super(key: key);

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "GDSC",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            floatingActionButton: Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 0, mq.width * 0.01, mq.width * 0.05),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(mq.width * 0.04)))),
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddItemScr()));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: mq.width * 0.04, horizontal: mq.width * 0.01),
                  child: Icon(
                    Icons.add,
                    size: mq.width * 0.07,
                  ),
                ),
              ),
            ),
            body: (ItemList.lst.length != 0)
                ? ListView.builder(
                    itemCount: ItemList.lst.length,
                    itemBuilder: (context, index) {
                      return YourItemList.itemCard(
                          context,
                          ItemList.lst.elementAt(index).itemName,
                          ItemList.lst.elementAt(index).amount,
                          ItemList.lst.elementAt(index).currentDate,
                          ItemList.lst.elementAt(index).cTime);
                    })
                : Center(
                    child: Text(
                      "No List Available !!",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 20,
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    ),
                  )));
  }
}
