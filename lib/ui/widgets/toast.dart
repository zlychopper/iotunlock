import 'package:flutter/material.dart';

class Toast {
  static void show(BuildContext context, String msg, {int duration}) {
    OverlayEntry entry = OverlayEntry(builder: (context) {
      return new Container(
        color: Colors.transparent,
//        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.7),
        alignment: Alignment.center,
        child: new Center(
          child: new Container(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Material(
                color: Colors.grey,
                child: Text(
                  msg,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      );
    });
    Overlay.of(context).insert(entry);
    Future.delayed(Duration(seconds: duration ?? 2)).then((value) {
      entry.remove();
    });
  }
}
