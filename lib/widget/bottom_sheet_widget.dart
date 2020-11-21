import 'package:flutter/material.dart';

class BottomSheetWidget {
  static BottomSheetWidget bottomsheet;

  static BottomSheetWidget getInstance() {
    if (bottomsheet == null) {
      bottomsheet = BottomSheetWidget();
    }
    return bottomsheet;
  }

  bottomSheet(BuildContext context, String title, String msg) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  title: Text(title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  title: Text(msg, style: TextStyle(fontSize: 16.0),),
                ),
                ButtonBar(
                  children: [
                    FlatButton(
                      onPressed: () => Navigator.pop(context), 
                      child: Text('ปิดหน้าต่าง', style: TextStyle(fontSize: 16.0),)
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}