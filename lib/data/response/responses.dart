import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';


@JsonSerializable()
class BaseResponse{
  @JsonKey(name:"status")
  int ? status;
  @JsonKey(name: "message")
  String? message;
  BaseResponse(this.status,this.message);

//from Json
factory BaseResponse.fromJson(Map<String ,dynamic> json)=>_$BaseResponseFromJson(json);
//To json
Map<String,dynamic> toJson()=>_$BaseResponseToJson(this);
}



@JsonSerializable()
class CustomerResponse{
  @JsonKey(name:"id")
  int ? id;
  @JsonKey(name: "name")
  String? name;
  CustomerResponse(this.id,this.name);
//from Json
  factory CustomerResponse.fromJson(Map<String ,dynamic> json)=>_$CustomerResponseFromJson(json);
//To json
  Map<String,dynamic> toJson()=>_$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactResponse{
  @JsonKey(name:"phone")
  String ? phone;
  @JsonKey(name: "email")
  String? email;
  ContactResponse(this.phone,this.email);

//from Json
  factory ContactResponse.fromJson(Map<String ,dynamic> json)=>_$ContactResponseFromJson(json);
//To json
  Map<String,dynamic> toJson()=>_$ContactResponseToJson(this);
}

@JsonSerializable()
class AuthResponse extends BaseResponse{
  @JsonKey(name:"customer")
  CustomerResponse ? customerResponse;
  @JsonKey(name: "contact")
  ContactResponse? contactResponse ;

  AuthResponse(int? status, String? message) : super(status, message);

//from Json
  factory AuthResponse.fromJson(Map<String ,dynamic> json)=>_$AuthResponseFromJson(json);
//To json
  @override
  Map<String,dynamic> toJson()=>_$AuthResponseToJson(this);
}
