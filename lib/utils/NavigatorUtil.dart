import 'package:flutter/material.dart';
import 'package:iot_unlock/ui/widgets/web_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigatorUtil {
  static void pushPage(BuildContext context, Widget page) {
    if (context == null || page == null) return;
//    Navigator.push(context, new MaterialPageRoute(builder: (context) => page));
    Navigator.push<String>(
        context,
        new PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              // 跳转的路由对象
              return page;
            },
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return createTransition(animation, child);
            },
            transitionDuration: Duration(milliseconds: 200)));
  }

  static void pushReplacePage(BuildContext context, Widget page) {
    Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context) => page));
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void pushWeb(BuildContext context, String title, String url) {
    if (context == null || url == null || title == null) {
      return;
    }
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new WebScaffold(
                  url: url,
                  title: title,
                )));
  }

  static Future<Null> launchInBrowser(String url, {String title}) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }

//  static void pushWeb()
}
