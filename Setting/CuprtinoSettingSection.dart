import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterairdemo/Setting/Colors.dart';
import 'package:flutterairdemo/Setting/settings_section.dart';
import 'package:flutterairdemo/Setting/settings_tile.dart';

import 'colors.dart';

class CuprtinoSettingSection extends StatelessWidget {

  final List<Widget>items;
  final Widget header;
  final Widget footer;

  const CuprtinoSettingSection(this.items,{Key key,
  this.header,this.footer}) : assert(items != null),super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget>columChildren = [];
    if (header != null) {
      columChildren.add(
        DefaultTextStyle(
          style: TextStyle(
            color: CupertinoColors.inactiveGray,
            fontSize: 13.5,
            letterSpacing: -0.5,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 6,),
            child: header,
        )
      )
      );
    }

    List<Widget> itemWithDividers = [];
    for(int i =0; i< items.length;i++){
      final leftPadding = (items[i] as SettingsTile).leading == null ? 15.0:54.0;
      if (i< items.length - 1){
        itemWithDividers.add(items[i]);
        itemWithDividers.add(Divider(height: 0.3,indent: leftPadding,));
      }else{
        itemWithDividers.add(items[i]);
      }
    }
    
    columChildren.add(
      Container(
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border(
            top: BorderSide(
              color: Colors.red,
              width: 0.3
            ),
            bottom: BorderSide(
              color: Colors.red,
              width: 0.3
            )
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: itemWithDividers,
        ),
      )
    );

    if (footer != null) {
      columChildren.add(DefaultTextStyle(
        style: TextStyle(
          color: Colors.red,
          fontSize: 13.0,
          letterSpacing: -0.08,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 7.5,
          ),
          child: footer,
        ),
      ));
    }

    return Padding(
      padding: EdgeInsets.only(
        top: header == null ? 35.0 : 22.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columChildren,
      ),
    );
  }
}