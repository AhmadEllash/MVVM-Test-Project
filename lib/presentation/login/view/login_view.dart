import 'package:advanced_flutter/app/denpendeny_injection.dart';
import 'package:advanced_flutter/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:advanced_flutter/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // final LoginBaseViewModel _viewModel = LoginBaseViewModel(_loginUseCase);
  final LoginBaseViewModel _viewModel = instance<LoginBaseViewModel>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _userNameController.addListener(() {
      _viewModel.setUserName(_userNameController.text);
    });
    _userPasswordController.addListener(() {
      _viewModel.setUserPassword(_userPasswordController.text);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getDataContainer();
  }

  Widget _getDataContainer() {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(AppAssets.splashLogo),
                const SizedBox(
                  height: AppSize.s22,
                ),
                StreamBuilder<bool>(
                    stream: _viewModel.outIsUserNameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userNameController,
                        decoration: InputDecoration(
                          hintText: AppStrings.userName,
                          labelText: AppStrings.userName,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppStrings.userNameError,
                        ),
                      );
                    }),
                const SizedBox(
                  height: AppSize.s22,
                ),
                StreamBuilder<bool>(
                    stream: _viewModel.outIsUserPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _userPasswordController,
                        decoration: InputDecoration(
                          hintText: AppStrings.password,
                          labelText: AppStrings.password,
                          errorText: (snapshot.data ?? false)
                              ? null
                              : AppStrings.userPasswordError,
                        ),
                      );
                    }),
                StreamBuilder<bool>(
                    stream: _viewModel.outIsInputAllValid,
                    builder: (context, snapshot) {
                      return ElevatedButton(
                          onPressed: (snapshot.data ?? false)

                              ?() {
                                  _viewModel.login();
                                }  : null,
                          child: Text(
                            AppStrings.login,
                            style: Theme.of(context).textTheme.titleSmall,
                          ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
