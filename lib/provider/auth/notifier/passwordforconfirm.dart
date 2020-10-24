import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:pringnome/services/models/passwordforconfirm.dart';

class PasswordForConfirmNotifier with ChangeNotifier{
  List<PasswordForConfirm> _passwordForConfirmList = [];

  PasswordForConfirm _currentPasswordForConfirm;

  UnmodifiableListView<PasswordForConfirm> get passwordForConfirmList => UnmodifiableListView(_passwordForConfirmList);

  PasswordForConfirm get currentPasswordForConfirm => _currentPasswordForConfirm;

  set passwordForConfirmList(List<PasswordForConfirm> passwordForConfirmList){
    _passwordForConfirmList = passwordForConfirmList;
    notifyListeners();
  }

  set currentPasswordForConfrm(PasswordForConfirm passwordForConfirm){
    _currentPasswordForConfirm = passwordForConfirm;
    notifyListeners();
  }

}