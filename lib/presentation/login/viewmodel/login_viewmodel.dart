import 'dart:async';

import 'package:advanced_flutter/data/Network/failure.dart';
import 'package:advanced_flutter/domain/use%20cases/login_usercase.dart';
import 'package:advanced_flutter/presentation/base/base_view_model.dart';
import 'package:advanced_flutter/presentation/common/freezed_data_classes.dart';

class LoginBaseViewModel extends BaseViewModel with LoginViewModelInputs , LoginViewModelOutputs{
  final StreamController _userStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _checkAllInputStreamController = StreamController<void>.broadcast();

  final LoginUseCase _loginUseCase;
LoginBaseViewModel(this._loginUseCase);
  // LoginBaseViewModel();

  @override
  void dispose() {
_userStreamController.close();
_passwordStreamController.close();
_checkAllInputStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  var loginObject = LoginObject("","");
//Inputs
  @override
  // TODO: implement inputUserName
  Sink get inputUserName => _userStreamController.sink;

  @override
  // TODO: implement inputUserPassword
  Sink get inputUserPassword => _passwordStreamController.sink;


  @override
  // TODO: implement inputAllValid
  Sink get inputAllValid => _checkAllInputStreamController.sink;

  @override
  login() async{
    // (await _loginUseCase.execute(LoginUseCaseInput(loginObject.userName, loginObject.password)))
    //     .fold((failure) {
    //
    // }, (data) {
    //    return data.customer?.name;
    // });
  }
  @override
  setUserName(String username) {
   inputUserName.add(username);
   loginObject = loginObject.copyWith(userName: username);
   _checkAllInputStreamController.add(null);
  }

  @override
  setUserPassword(String password) {
    inputUserPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    _checkAllInputStreamController.add(null);



  }

  //Outputs

  @override
  Stream<bool> get outIsUserNameValid => _userStreamController.stream.map((username) => isValidUserName(username));

  @override
  Stream<bool> get outIsUserPasswordValid => _passwordStreamController.stream.map((password) => isValidPassword(password));

  @override
  Stream<bool> get outIsInputAllValid => _checkAllInputStreamController.stream.map((_)=>isAllInputsValid());

  bool isAllInputsValid(){
    return isValidUserName(loginObject.userName) && isValidPassword(loginObject.password);
  }

bool isValidUserName(String username){
    return  username.isNotEmpty;

}
  bool isValidPassword(String password){
    return  password.isNotEmpty;

  }



}
abstract class LoginViewModelInputs {
  setUserName(String username);
  setUserPassword(String password);
  login();

  Sink get inputUserName;
  Sink get inputUserPassword;
  Sink get inputAllValid;

}
abstract class LoginViewModelOutputs{
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsUserPasswordValid;
  Stream<bool> get outIsInputAllValid;



}