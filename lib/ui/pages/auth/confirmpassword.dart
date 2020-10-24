import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pringnome/services/stores/login_store.dart';


class ConfirmPassword extends StatefulWidget {
  @override
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  TextEditingController passwordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
        builder: (_, loginStore, __){
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Flexible(
                flex: 1,
                  child: Center(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            CupertinoTextField(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(Radius.circular(4))
                              ),
                              controller: passwordConfirm,
                              obscureText: true,
                              clearButtonMode: OverlayVisibilityMode.editing,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              placeholder: 'Masukkan Password Anda',
                            ),
                            RaisedButton(
                              child: Text("Konfirmasi Password"),
                                onPressed: (){}
                                )
                          ],
                        ),
                      )
                  )
              ),
            ),
          );
        }
    );
  }
}
