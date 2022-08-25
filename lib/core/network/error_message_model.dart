import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool success;
  final int status_code;
  final String status_message;


  const ErrorMessageModel({
    required this.success,
    required this.status_code,
    required this.status_message,

      });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>ErrorMessageModel(
    success: json['success'],
    status_code: json['status_code'],
    status_message:json['status_message'],
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    success,
    status_code,
    status_message,
  ];
}


