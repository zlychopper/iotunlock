import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final double radius;
  final Color bgColor;
  final String text;
  final TextStyle style;
  final VoidCallback onPressed;
  final Widget child;
  final Decoration decoration;
  const RoundButton(
      {Key key,
      this.width,
      this.height = 50,
      this.margin,
      this.radius = 8,
      this.bgColor,
      this.text,
      this.style,
      this.child,
      this.onPressed,
      this.decoration});
  @override
  Widget build(BuildContext context) {
    Color _bgColor = bgColor ?? Theme.of(context).primaryColor;
    BorderRadius _borderRadius = BorderRadius.circular(radius);
    return new Container(
      width: width,
      height: height,
      margin: margin,
      child: new Material(
        borderRadius: _borderRadius,
        color: _bgColor,
        child: new InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: child ??
              new Center(
                child: new Text(
                  text,
                  style:
                      style ?? new TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
        ),
      ),
      decoration: decoration,
    );
  }
}
