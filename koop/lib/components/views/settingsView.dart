import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isLightMode;

  @override
  void initState() {
    isLightMode =
        DynamicTheme.of(context).brightness == Brightness.dark ? false : true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: Theme(
        data: DynamicTheme.of(context).data,
        child: SettingsList(
          sections: [
            SettingsSection(title: 'Apparence', tiles: [
              SettingsTile.switchTile(
                title: 'Light mode',
                leading: Icon(Icons.brightness_medium),
                switchValue: isLightMode,
                onToggle: (bool newValue) {
                  setState(() {
                    isLightMode = newValue;
                  });
                  DynamicTheme.of(context).setBrightness(
                      Theme.of(context).brightness == Brightness.dark
                          ? Brightness.light
                          : Brightness.dark);
                },
              ),
            ]),
            SettingsSection(
              title: 'Mon Compte',
              tiles: [
                SettingsTile(
                  title: 'Changer mot de passe',
                  leading: Icon(Icons.lock),
                  onTap: () {
                    // TODO: Add navigation to change passwordpage
                  },
                ),
                SettingsTile(
                  title: 'Se deconnecter',
                  leading: Icon(Icons.input),
                  onTap: () {
                    // TODO: Add navigation to change passwordpage
                  },
                ),
              ],
            ),
            SettingsSection(
              title: 'Informations legales',
              tiles: [
                SettingsTile(
                  title: 'Termes de  services',
                  leading: Icon(Icons.library_books),
                  onTap: () {
                    // TODO: Add navigation to change passwordpage
                  },
                ),
                SettingsTile(
                  title: 'Licences',
                  leading: Icon(Icons.assignment),
                  onTap: () {
                    // TODO: Add navigation to change passwordpage
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
