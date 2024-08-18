import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class Settings extends StatefulWidget
{
  const Settings({super.key});


  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
{
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
  );
}