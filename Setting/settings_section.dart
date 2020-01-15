
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterairdemo/Setting/CuprtinoSettingSection.dart';
import 'package:flutterairdemo/Setting/settings_tile.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsTile> lists;
  bool showBottomDivider = false;

   SettingsSection({
    Key key,
    this.title,
    this.lists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return iosSection(context);
    }else{
      return androidSection(context);
    }
  }

  Widget iosSection(BuildContext context){
    return CuprtinoSettingSection(lists,
    header : title == null ? null:Text(title));
  }

  Widget androidSection(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title == null ?Container():
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(title,
          style:TextStyle(
            color:Theme.of(context).accentColor,
            fontWeight: FontWeight.bold
          )),
        ),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: lists.length,
          itemBuilder: (context,index){
            return lists[index];
          },
          separatorBuilder: (context,index){
            Divider(height: 1,);
          },
        ),
        if(showBottomDivider) Divider(height: 1,),
      ],
    );
  }

}