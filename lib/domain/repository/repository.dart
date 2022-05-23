
import 'package:advanced_flutter/data/Network/requests.dart';
import 'package:advanced_flutter/domain/models/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/Network/failure.dart';

abstract class Repository{
Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
}