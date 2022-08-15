import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../repository/auth_repository.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class AuthViewModel extends ChangeNotifier
{
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading ;

  bool _signUpLoading = false ;
  bool get signUpLoading => _signUpLoading ;


  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data , BuildContext context) async {

    setLoading(true);

    _myRepo.loginApi(data).then((value){
      setLoading(false);
     // final userPreference = Provider.of<UserViewModel>(context , listen: false);
     //  userPreference.saveUser(
     //      UserModel(
     //          token: value['token'].toString()
     //      )
     //  );

      Utils.flushBarErrorMessage(context,'Login Successfully', );
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());

      }
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarErrorMessage(context, error.toString(), );
      if(kDebugMode){
        print(error.toString());
      }

    });
  }
}