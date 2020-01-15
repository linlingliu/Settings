


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterairdemo/Setting/CuprtinoSettingItem.dart';

enum _settingsTileType {simple, switchTile}

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  final VoidCallback onTap;
  final Function(bool)onToggle;
  final bool switchValue;
  final _settingsTileType _tileTile;

  const SettingsTile({
    Key key,
    @required this.title,
    this.subtitle,
    this.leading,
    this.onTap}) : _tileTile = _settingsTileType.simple,
    onToggle = null,
    switchValue = null,
    super(key: key);

  const SettingsTile.switchTile({
    Key key,
    @required this.title,
    this.subtitle,
    this.leading,
    @required this.switchValue,
    @required this.onToggle,
  }):_tileTile = _settingsTileType.switchTile,
  onTap = null,
  super(key:key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return iosTile();
    }else{
      return androidTile();
    }
  }

  Widget iosTile() {
    if(_tileTile == _settingsTileType.switchTile){
      return CupertionSettingsItem(
        type: SettingsItemType.toggle,
        label: title,
        leading: leading,
        switchValue: switchValue,
        onToggle: onToggle,
        subtitle: "LX",
      );
    }else{
      return CupertionSettingsItem(
        type: SettingsItemType.modal,
        label: title,
        leading: leading,
        switchValue: switchValue,
        onToggle: onToggle,
        value: subtitle,
        hasDetails: true,
        onPress: onTap,
      );
    }
  }

  Widget androidTile(){
    if(_tileTile == _settingsTileType.switchTile){
      return SwitchListTile(
        secondary: leading,
        value: switchValue,
        onChanged: onToggle,
        title: Text(title),
        subtitle: subtitle !=null ?Text(subtitle):null,
      );
    }else{
      return ListTile(
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle):null,
        leading: leading,
        onTap: onTap,
      );
    }
  }
}