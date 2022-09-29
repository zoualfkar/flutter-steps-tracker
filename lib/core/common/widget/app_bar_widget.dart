import 'dart:io';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget  implements PreferredSizeWidget{

  final bool showIcon;
  final String title;

  const AppBarWidget({
    required this.title,
    this.showIcon=true,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(Platform.isAndroid){
      return  AppBar(
        leading:showIcon? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ) :null,
        title: Text(title),
      );
    }
    return  AppBar(
      leading:showIcon? IconButton(
          icon: const Icon(Icons.arrow_back_ios),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ) :null,
      title: Text(title),
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(60);
}
