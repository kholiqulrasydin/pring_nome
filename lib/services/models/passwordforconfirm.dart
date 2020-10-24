class PasswordForConfirm{
  String passconfirm;
  String uID;

  PasswordForConfirm.fromMap(Map<String, dynamic> data){
    uID = data['id'];
    passconfirm = data['password'];
  }

}