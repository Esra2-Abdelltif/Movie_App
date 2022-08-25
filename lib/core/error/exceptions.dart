import 'package:movies_and_tv_app/core/network/error_message_model.dart';


//bta5d error mn model ele createh w b7toh fe expention class w a2dr ast5dmh fe kol app
// throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  const ServerException({ required this.errorMessageModel});
}


class LocaolDataBaseException implements Exception{
  final String Message;

  const LocaolDataBaseException({ required this.Message});
}