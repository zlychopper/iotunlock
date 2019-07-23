import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot_unlock/res/colors.dart';
import 'package:iot_unlock/res/strings.dart';
import 'package:iot_unlock/ui/pages/loginreg/reg_pwd_page.dart';
import 'package:iot_unlock/ui/widgets/input_text_label.dart';
import 'package:iot_unlock/ui/widgets/round_button.dart';
import 'package:iot_unlock/utils/NavigatorUtil.dart';

class RegPhonePage extends StatelessWidget {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
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
                child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      InputTextWithLabel(
                        controller: _phoneController,
                        labelText: IntlUtil.getString(context, Ids.label_phone),
                        hintText:
                            IntlUtil.getString(context, Ids.input_phone_no),
                        maxLength: 11,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InputTextWithLabel(
                              controller: _codeController,
                              labelText: IntlUtil.getString(
                                  context, Ids.label_check_code),
                              hintText: IntlUtil.getString(
                                  context, Ids.input_check_code),
                            ),
                          ),
                          RoundButton(
                            text:
                                IntlUtil.getString(context, Ids.get_check_code),
                            width: 100,
                            height: 40,
                            margin: EdgeInsets.only(right: 20),
                            bgColor: Colors.white,
                            style:
                                TextStyle(color: Colours.gray_66, fontSize: 16),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colours.gray_e4, width: 1),
//                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              RoundButton(
                margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                text: IntlUtil.getString(context, Ids.next_step),
                onPressed: () {
                  _checkCode(context);
                },
              )
            ],
          ),
        ));
  }

  _checkCode(BuildContext context) {
    NavigatorUtil.pushPage(context, RegPwdPage());
  }
}
