import 'package:flutter/material.dart';
import 'package:jc_notes_taking_app_flutter/Components/drawer_tile.dart';
import '../Pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const DrawerHeader(
              child: Icon(
            Icons.note,
            size: 40,
          )),

          const SizedBox(
            height: 10,
          ),

          // Call Drawer Tile class
          DrawerTile(
            title: "H O M E",
            leading: const Icon(Icons.home),
            function: () {
              Navigator.pop(context);
            },
          ),

          const SizedBox(
            height: 10,
          ),

          DrawerTile(
            title: "S E T T I N G S",
            leading: const Icon(Icons.settings),
            function: () {
              Navigator.pop(context);

              // Navigate to New Page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
          ),
        ],
      ),
    );
  }
}
