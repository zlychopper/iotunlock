import 'package:flutter/material.dart';
import 'package:iot_unlock/models/models.dart';
import 'package:iot_unlock/res/styles.dart';
import 'package:iot_unlock/ui/pages/loginreg/login_page.dart';
import 'package:iot_unlock/utils/NavigatorUtil.dart';

class CommonArrow extends StatelessWidget {
  final ComModel model;
  final Function f;
  final bool replace;
  const CommonArrow(this.model, {Key key,this.f,this.replace=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Material(
        color: Colors.white,
        child: ListTile(
          onTap: () {
            if(f!=null){
              f();
            }else{
              if (model.page == null) {
              } else {
                if(replace){
                  NavigatorUtil.pushReplacePage(context, model.page);
                }else{
                  NavigatorUtil.pushPage(context, model.page);
                }
              }
            }

          },
          title: Text(model.title ?? ""),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                model.extra ?? "",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
      decoration: Decorations.bottom,
    );
  }
}
