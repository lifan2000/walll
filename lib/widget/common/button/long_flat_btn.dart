import 'package:flutter/material.dart';
import 'package:wall/constant/color_constant.dart';
import 'package:wall/util/theme_util.dart';

class LongFlatButton extends StatelessWidget {
  VoidCallback? onPressed;
  late final bool enabled;
  late final bool needGradient;
  final Color? bgColor;
  late final Text text;
  final double radius;

  LongFlatButton({
    Key? key,
    required this.text,
    this.enabled = false,
    this.needGradient = true,
    this.bgColor,
    this.onPressed,
    this.radius = 6.0
  })  : assert(needGradient ^ (bgColor != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeUtil.isDark(context);

    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: enabled && needGradient
              ? LinearGradient(
                  colors: isDark
                      ? [const Color(0xaa4facfe), const Color(0xaa00f2fe)]
                      : [const Color(0xFF4facfe), const Color(0xFF00f2fe)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          color: enabled
              ? (needGradient ? null : bgColor!)
              : (isDark ? Colours.borderColorFirstDark : Colours.borderColorSecond),
        ),
        child: TextButton(
            child: text,
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            // color: _canGetCode ? Colors.amber : null,
            // padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            // disabledColor: !isDark ? Color(0xffD7D6D9) : Colours.dark_bg_color_darker,
            onPressed: enabled ? onPressed : null));
  }
}
