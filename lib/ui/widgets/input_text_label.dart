import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot_unlock/res/colors.dart';
import 'package:iot_unlock/res/dimens.dart';
import 'package:iot_unlock/res/styles.dart';

class InputTextWithLabel extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool hasSuffixIcon;
  final int maxLength;
  final List<TextInputFormatter> inputFormatters;

  const InputTextWithLabel(
      {Key key,
      this.controller,
      this.hintText,
      this.labelText,
      this.hasSuffixIcon = false,
      this.maxLength,
      this.inputFormatters})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InputTextWithLabelState();
  }
}

class InputTextWithLabelState extends State<InputTextWithLabel> {
  bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.hasSuffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
//        new Text(
//          widget.labelText,
//          style: new TextStyle(
//            fontSize: Dimens.font_sp16,
//            color: Colors.black,
//          ),
//        ),
        Gaps.hGap15,
        new Expanded(
            child: new TextField(
          obscureText: _obscureText,
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          maxLength: widget.maxLength,
          style:
              new TextStyle(color: Colours.gray_66, fontSize: Dimens.font_sp16),
          decoration: new InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              hintStyle: new TextStyle(
                  color: Colours.gray_99, fontSize: Dimens.font_sp16),
              suffixIcon: widget.hasSuffixIcon
                  ? new IconButton(
                      icon: new Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      })
                  : null,
              focusedBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colours.green_1)),
              enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colours.gray_e4))),
        )),
      ],
    );
  }
}
