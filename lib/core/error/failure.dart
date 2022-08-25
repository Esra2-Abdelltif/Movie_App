import 'package:equatable/equatable.dart';

 abstract class Failure extends Equatable{
  final String Message;

  const Failure( this.Message);

  @override
  // TODO: implement props
  List<Object?> get props => [Message];
}

class ServerFailure extends Failure{
  ServerFailure(String Message) : super(Message);
}

class LocalDataBaseFailure extends Failure{
  LocalDataBaseFailure(String Message) : super(Message);
}