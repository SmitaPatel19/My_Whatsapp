import 'package:flutter/material.dart';
import 'package:my_whatsapp/Extension/customThemeExtension.dart';

class CustomIconButton extends StatelessWidget {

  final VoidCallback onTap;
  final IconData icon;
  final Color? iconcolor;
  final double? iconsize;
  final double? minWidth;
  final Color? background;
  final BoxBorder? border;

  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconcolor,
    this.iconsize,
    this.minWidth,
    this.background,
    this.border
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: border,
      ),
      child: IconButton(
          onPressed: onTap,
          splashColor: Colors.transparent,
          splashRadius: (minWidth ?? 45)-25,
          iconSize: iconsize ?? 22,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
              minWidth: minWidth ?? 40,
              minHeight: minWidth ?? 45
          ),
          icon: Icon(
            icon,
            color: iconcolor ?? context.theme.greyColor,
          )
      ),
    );
  }
}
