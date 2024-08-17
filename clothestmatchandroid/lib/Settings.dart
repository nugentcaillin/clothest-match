import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'Gallery.dart';
import 'interactiveQueue.dart';
import 'main.dart';

class Settings extends StatefulWidget
{
  const Settings({super.key});


  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
{
  final tabs = [MyHomePage(title: "Home"), InteractiveQueue(title: "Interactive Queue"), Gallery(), Settings()];

  int currentPageIndex = 3;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Container(alignment: Alignment.center, padding: const EdgeInsets.all(16),
      child: SettingsList(
        sections: [
                SettingsSection(
                  title: const Text('Settings'),
                  tiles: [
                    SettingsTile(
                      title: const Text('Language'),
                      description: const Text('English'),
                      leading: const Icon(Icons.language),
                      onPressed: (BuildContext context) {},
                    ),
                    SettingsTile.switchTile(
                      initialValue: false,
                      title: const Text('Use fingerprint'),
                      leading: const Icon(Icons.fingerprint),
                      onToggle: (bool value) {},
                    ),
                  ],
                ),
              ],)
    )),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_sharp),
          label: 'Interactive Queue',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder_special),
          label: 'Gallery',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onTap: (index) {
        setState(() {
          currentPageIndex = index;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => tabs[currentPageIndex]),
          );
        });
      },
    ),
  );
}