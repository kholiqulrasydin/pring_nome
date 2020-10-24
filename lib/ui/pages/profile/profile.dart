import 'package:flutter/material.dart';
import 'package:pringnome/services/stores/login_store.dart';
import 'package:pringnome/ui/components/theme.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: RaisedButton(
            onPressed: ()async{
              await LoginStore().signOut(context);
            },
            color: MyColors.primaryColor,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: MyColors.primaryColorLight,
                    ),
                    child: Icon(
                      Icons.phonelink_erase,
                      color: Colors.white,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
