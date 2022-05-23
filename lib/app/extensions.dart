import 'package:advanced_flutter/app/constants.dart';
import 'package:advanced_flutter/data/Network/error_handler.dart';

extension ConverNullableString on String?{
  String checkNullString(){
    if(this == null){
      return AppConstants.empty;
    }else{
      return this!;
    }
  }
}
extension ConverNullableInt on int?{
  int checkNullInt(){
    if(this == null){
      return AppConstants.zero;
    }else{
      return this!;
    }
  }
}

