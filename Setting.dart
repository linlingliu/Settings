
import 'package:flutter/material.dart';
import 'package:flutterairdemo/Setting/settings_list.dart';
import 'package:flutterairdemo/Setting/settings_section.dart';
import 'package:flutterairdemo/Setting/settings_tile.dart';

class Seeting extends StatefulWidget {
  Seeting({Key key}) : super(key: key);

  @override
  _SeetingState createState() => _SeetingState();
}

class _SeetingState extends State<Seeting> {
  bool lockInBackground = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        backgroundColor: Colors.blue,
      ),
      body: SettingList(
        sections: [
          SettingsSection(
            title: "Section1",
            lists: [
              SettingsTile(
              title: "Language",
              subtitle: "English",
              leading: Icon(Icons.language),
              onTap: (){
                print("language");
              },
            ),
            SettingsTile.switchTile(
              title: "Use fingerPrint",
              leading: Icon(Icons.fingerprint),
              switchValue: lockInBackground,
              onToggle: (bool value){
                print(value);
                setState(() {
                  lockInBackground = !lockInBackground;
                });
              },
            )
            ],
          ),
          SettingsSection(
             title: "Section2",
            lists: [
              SettingsTile(
              title: "Language2",
              subtitle: "English2",
              leading: Icon(Icons.language),
              onTap: (){
                print("language2");
              },
            ),
            SettingsTile.switchTile(
              title: "Use fingerPrint2",
              leading: Icon(Icons.fingerprint),
              switchValue: lockInBackground,
              onToggle: (bool value){
                print(value);
                setState(() {
                  lockInBackground = !lockInBackground;
                });
              },
            )
            ],
          ),
        ],
      ),
    );
  }
}