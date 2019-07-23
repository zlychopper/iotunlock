import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:iot_unlock/res/colors.dart';
import 'package:iot_unlock/res/strings.dart';
import 'package:iot_unlock/ui/widgets/input_text_label.dart';
import 'package:iot_unlock/ui/widgets/round_button.dart';

class RegPwdPage extends StatelessWidget {
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _repwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(IntlUtil.getString(context, Ids.titleReg)),
        ),
        backgroundColor: Colours.gray_e4,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      InputTextWithLabel(
                        controller: _pwdController,
                        hasSuffixIcon: true,
                        labelText: IntlUtil.getString(context, Ids.label_pwd),
                        hintText:
                            IntlUtil.getString(context, Ids.input_pwd_hint),
                      ),
                      InputTextWithLabel(
                        controller: _repwdController,
                        hasSuffixIcon: true,
                        labelText:
                            IntlUtil.getString(context, Ids.label_re_pwd),
                        hintText:
                            IntlUtil.getString(context, Ids.input_repwd_hint),
                      ),
                    ],
                  ),
                ),
              ),
              RoundButton(
                margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                text: IntlUtil.getString(context, Ids.submit),
              )
            ],
          ),
        ));
  }
}
