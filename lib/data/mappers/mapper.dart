
import 'package:advanced_flutter/data/response/responses.dart';
import 'package:advanced_flutter/domain/models/models.dart';
import 'package:advanced_flutter/app/extensions.dart';
extension CustomerResponseMapper on CustomerResponse{
  Customer toDomain(){
    return Customer(id.checkNullInt(), name.checkNullString());
  }
}
extension ContactResponseMapper on ContactResponse{
  Contact toDomain(){
    return Contact(phone.checkNullString(), email.checkNullString());
  }
}
extension AuthentcationResponseMapper on AuthResponse{
  Authentication toDomain(){
    return Authentication(customerResponse?.toDomain(),contactResponse?.toDomain());
  }
}