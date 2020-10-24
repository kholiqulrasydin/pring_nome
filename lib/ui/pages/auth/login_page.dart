import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pringnome/services/auth/authservices.dart';
import 'package:provider/provider.dart';
import 'package:pringnome/services/stores/login_store.dart';
import 'package:pringnome/ui/components/theme.dart';
import 'package:pringnome/ui/components/widgets/loader_hud.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  var re = RegExp(r'\d{1}');

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Observer(
          builder: (_) => LoaderHUD(
            inAsyncCall: loginStore.isLoginLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              key: loginStore.loginScaffoldKey,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        height: 240,
                                        constraints: const BoxConstraints(
                                          maxWidth: 500
                                        ),
                                        margin: const EdgeInsets.only(top: 100),
                                        decoration: const BoxDecoration(color: Color(0xFFE1E0F5), borderRadius: BorderRadius.all(Radius.circular(30))),
                                        child: Container(
                                            decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(30))),
                                            height: 240,
                                            child: Image.asset('assets/rebung.jpg')),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('PringNome',
                                      style: TextStyle(color: MyColors.primaryColor, fontSize: 30, fontWeight: FontWeight.w800)))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: 500
                                  ),
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(text: 'Kami Akan Mengirimkan ', style: TextStyle(color: MyColors.primaryColor)),
                                      TextSpan(
                                          text: 'PIN OTP ', style: TextStyle(color: MyColors.primaryColor, fontWeight: FontWeight.bold)),
                                      TextSpan(text: 'di nomor HP ini', style: TextStyle(color: MyColors.primaryColor)),
                                    ]),
                                  )),
                              Container(
                                height: 40,
                                constraints: const BoxConstraints(
                                  maxWidth: 500
                                ),
                                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: CupertinoTextField(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(4))
                                  ),
                                  controller: phoneController,
                                  clearButtonMode: OverlayVisibilityMode.editing,
                                  keyboardType: TextInputType.phone,
                                  maxLines: 1,
                                  placeholder: '08...(Nomor Indonesia)',
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                constraints: const BoxConstraints(
                                    maxWidth: 500
                                ),
                                child: RaisedButton(
                                  onPressed: () async {
                                    String number = phoneController.text.toString().replaceFirst(re, '+62');
                                    if (phoneController.text.isNotEmpty) {
                                      await AuthServices.signInAnonymous();
                                      String verified = await AuthServices.verifUserNum(number);
                                      if(verified == 'true'){
                                        await AuthServices.signOut();
                                        loginStore.getCodeWithPhoneNumber(context, phoneController.text.toString().replaceFirst(re, '+62'));
                                      }else {
                                        await AuthServices.signOut();
                                        loginStore.loginScaffoldKey.currentState.showSnackBar(SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            'Mohon Maaf Nomor Anda Tidak Terdaftar',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ));
                                      }
                                    } else {
                                      loginStore.loginScaffoldKey.currentState.showSnackBar(SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          'Silahkan Masukkan Nomor Anda Terlebih Dahulu',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ));
                                    }
                                  },
                                  color: MyColors.primaryColor,
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Selanjutnya',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                            color: MyColors.primaryColorLight,
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
