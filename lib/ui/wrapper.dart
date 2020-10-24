import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pringnome/services/stores/login_store.dart';
import 'package:pringnome/ui/components/theme.dart';
import 'package:pringnome/ui/pages/auth/login_page.dart';
import 'package:pringnome/ui/screens/home.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

//  void _anonymouslyLogin() async{
//
//    if (AuthServices.firebaseUserStream == null) {
//      await AuthServices.signInAnonymous();
//    } else{
//      await AuthServices.signOut();
//      await AuthServices.signInAnonymous();
//    }
//
//  }

  @override
  void initState() {
    super.initState();
//    _anonymouslyLogin();
    Provider.of<LoginStore>(context, listen: false).isAlreadyAuthenticated().then((result) {
      if (result) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const HomeScreen()), (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const LoginPage()), (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
    );
  }
}
