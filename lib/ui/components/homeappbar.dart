import 'package:flutter/material.dart';
import 'package:pringnome/ui/components/theme.dart';

AppBar HomeAppBar(int index) {
  switch(index){
    case 0:
      return AppBar(
        title: Text('Reboeng Admin Dashboard'),
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        actions: <Widget>[
          Icon(Icons.notifications),
          Container(
            width: 50,
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://cdn4.iconfinder.com/data/icons/linecon/512/photo-512.png"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff00ff1d),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      );
      break;
    case 1:
      return AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Text('Chat With Customer'),
      );
      break;
    case 2:
      return AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Text('Profile'),
      );
      break;
  }
}