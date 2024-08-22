import 'package:flutter/material.dart';
import 'package:jc_notes_taking_app_flutter/Components/note_settings.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  const NoteTile(
      {super.key,
      required this.text,
      this.onEditPressed,
      this.onDeletePressed});

  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: ListTile(
          title: Text(text),
          trailing: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => showPopover(
                width: 100,
                  height: 100,
                  context: context,
                  bodyBuilder: (context) => NoteSettings(
                    onDeleteTap: onDeletePressed,
                    onEditTap: onEditPressed,
                  )),
            ),
          )),
    );
  }
}
