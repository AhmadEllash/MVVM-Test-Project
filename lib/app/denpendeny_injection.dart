
import 'package:advanced_flutter/app/app_prefs.dart';
import 'package:advanced_flutter/data/Network/app_api.dart';
import 'package:advanced_flutter/data/Network/dio_factory.dart';
import 'package:advanced_flutter/data/Network/network_info.dart';
import 'package:advanced_flutter/data/data_source/remote_data_source.dart';
import 'package:advanced_flutter/data/repository/repository_impl.dart';
import 'package:advanced_flutter/domain/repository/repository.dart';
import 'package:advanced_flutter/domain/use%20cases/login_usercase.dart';
import 'package:advanced_flutter/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule()async{
  //shared_preferences
  final  _sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => _sharedPreferences);
  //App Preference
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  //Network INfo
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  //Dio Factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  Dio dio = await instance<DioFactory>().getDio();
  //APP SERVICE CLIENT
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  //REMOTE DATA SOURCE
  instance.registerLazySingleton<RemoteDataSource>(() =>RemoteDataSourceImpl(instance<AppServiceClient>()) );
  //Repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance<NetworkInfo>(), instance<RemoteDataSource>()));
}

Future<void> initLoginModule()async{
instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
instance.registerFactory<LoginBaseViewModel>(() =>LoginBaseViewModel(instance()) );

}