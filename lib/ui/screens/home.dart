import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pringnome/ui/components/homeappbar.dart';
import 'package:pringnome/ui/pages/chat/chat.dart';
import 'package:pringnome/ui/pages/home/dashboard.dart';
import 'package:pringnome/ui/pages/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:pringnome/services/stores/login_store.dart';
import 'package:pringnome/ui/components/theme.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _indexPage = 0;

  final List<Widget> _page = [
    Dashboard(),
    ChatPage(),
    ProfilePage()
  ];

  void _onTappedBar(int index){
    setState(() {
      _indexPage = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: HomeAppBar(_indexPage),
          body: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width,
                  child: _page[_indexPage]
              ),
              Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 1),
                      )// changes position of shadow
                  ],
                ),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.79),
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.9,
                child: FloatingNavbar(
                  selectedBackgroundColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  borderRadius: 11,
                  itemBorderRadius: 11,
                  backgroundColor: Colors.white,
                  selectedItemColor: MyColors.primaryColorLight,
                  items:[
                    FloatingNavbarItem(
                      icon: Icons.home,
                      title: 'Home',
                    ),
                    FloatingNavbarItem(
                      icon: Icons.chat,
                      title: 'Chat',
                    ),
                    FloatingNavbarItem(
                      icon: Icons.perm_identity,
                      title: 'Profile',
                    ),
                  ],
                  currentIndex: _indexPage,
                  onTap: (index){_onTappedBar(index);},
                ),
              )
            ],
          ),
        );
      },
    );
  }

}
