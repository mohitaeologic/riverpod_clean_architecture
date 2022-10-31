import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean_architecture/domain/usecases/login_user_usecases.dart';

final loginController = ChangeNotifierProvider<LoginController>(
      (ref) => LoginController(),
);


class LoginController extends ChangeNotifier {

  bool isLoading = false;
  bool isLoggedIn = false;
  login({required String username,required String password,required String clientCode})async{
    LoginUser loginUser = LoginUser();
    isLoading = true;
    notifyListeners();
   final response =  await loginUser.execute(
        username:username,
        password:password,
        clientCode:clientCode
   );
   if(response != null ){
     isLoading = false;
     isLoggedIn = true;
     notifyListeners();
   }
   return response;
  }

}