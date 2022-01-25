import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_project/MainScreens/home.dart';
import 'package:gdsc_project/model/list_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddItemScr extends StatefulWidget {
  AddItemScr({Key? key}) : super(key: key);

  @override
  State<AddItemScr> createState() => _AddItemScrState();
}

class _AddItemScrState extends State<AddItemScr> {
  TextEditingController itemName = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat("yyyy-mm-dd");
    String formattedDate = formatter.format(now);
    String time = DateFormat.Hm().format(now);
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Add Item",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 20,
                color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              mq.width * 0.05, mq.height * 0.05, mq.width * 0.05, 0),
          child: Column(
            children: [
              TextFormField(
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 15),
                controller: itemName,
                decoration: const InputDecoration(
                    hintText: "Item name",
                    prefixIcon: Icon(
                      Icons.text_snippet_outlined,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Item Name"),
              ),
              SizedBox(
                height: mq.height * 0.05,
              ),
              TextFormField(
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 15),
                controller: amount,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Amount",
                    prefixIcon: Icon(
                      CupertinoIcons.money_dollar,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Amount"),
              ),
              SizedBox(
                height: mq.height * 0.06,
              ),
              SizedBox(
                width: mq.width - 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      if (itemName.text.isEmpty || amount.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Please Entry should be filled",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 14, color: Colors.white),
                        )));
                      } else {
                        setState(() {
                          ItemList.lst.add(ModelList(
                              itemName: itemName.text,
                              currentDate: formattedDate,
                              cTime: time,
                              amount: amount.text));
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScr()),
                              (route) => false);
                        });
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: mq.height * 0.02),
                      child: Text(
                        "Add item",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 20, color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
