import 'package:flutter/material.dart';
import 'package:pringnome/ui/components/theme.dart';

Color primaryColor = MyColors.primaryColorLight;

class AccountCard extends StatelessWidget {
  final bool active;
  final String name;
  final String id;
  final String productTotal;

  const AccountCard(
      {Key key, this.active = false, this.name, this.productTotal, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: active ? primaryColor : Colors.white,
      ),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
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
            Container(
              width: 180,
              child: ListTile(
                title: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Delivery ID : $id'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  productTotal,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.check_circle,
                  size: 30,
                  color: Color(0xff26e56d),
                ),
                Icon(
                  Icons.cancel,
                  size: 30,
                  color: Color(0xffff4077),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
