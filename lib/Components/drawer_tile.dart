import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {super.key, required this.title, required this.leading, this.function});

  final String title;
  final Widget leading;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: leading,
        onTap: function,
      ),
    );
  }
}
