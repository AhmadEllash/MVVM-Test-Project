
import 'package:advanced_flutter/data/Network/error_handler.dart';
import 'package:advanced_flutter/data/Network/failure.dart';
import 'package:advanced_flutter/data/Network/network_info.dart';
import 'package:advanced_flutter/data/Network/requests.dart';
import 'package:advanced_flutter/data/data_source/remote_data_source.dart';
import 'package:advanced_flutter/data/mappers/mapper.dart';
import 'package:advanced_flutter/domain/models/models.dart';
import 'package:advanced_flutter/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:advanced_flutter/app/extensions.dart';
 class RepositoryImpl implements Repository {
   final NetworkInfo _networkInfo;
   final RemoteDataSource _remoteDataSource;
   RepositoryImpl(this._networkInfo,this._remoteDataSource);
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnected){
      try{
        final response = await _remoteDataSource.login(loginRequest);
        if(response.status == ApiInternalStatus.SUCCESS){
          return Right(response.toDomain());
        }else{
          return Left(Failure(response.status??ApiInternalStatus.FAILURE, response.message??ResponseMessage.Default));
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }
  else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}