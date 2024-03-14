import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  final bool isLeading;

  final double fontSize;

  const CustomAppBar({
    super.key,
    this.isLeading = true,
    this.fontSize = 32,
    required this.title,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isLeading ? const Icon(Icons.login) : null,
      actions: actions,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppBarTheme.of(context).backgroundColor,
      foregroundColor: AppBarTheme.of(context).foregroundColor,
      elevation: 0,
      iconTheme: AppBarTheme.of(context).iconTheme,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
