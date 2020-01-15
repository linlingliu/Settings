
import 'package:flutter/material.dart';
import 'package:flutterairdemo/Setting/Colors.dart';
import 'package:flutterairdemo/Setting/settings_section.dart';


class SettingList extends StatelessWidget {

  final List<SettingsSection>sections;

  const SettingList({Key key,this.sections}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.light ?
      backgroundGray
      :Colors.black,
      child: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context,index){
          SettingsSection current = sections[index];
          SettingsSection futureOne;
          try{
            futureOne = sections[index +1];
          }catch (e) {}
          if (futureOne != null && futureOne.title != null){
            current.showBottomDivider = false;
            return current;
          }else{
            current.showBottomDivider = true;
            return current;
          }
        },
      ),
    );
  }
}