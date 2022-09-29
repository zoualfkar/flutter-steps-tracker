import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel extends Equatable {
 const ErrorModel({
    this.error,
   this.detail,
  });

  final Error? error;
  final String? detail;

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  @override
  List<Object?> get props => [
        error,
      ];
}


@JsonSerializable()
class Error extends Equatable {
  const Error({
    this.code,
    this.title,
    this.message,
    this.path,
    this.originalError,
  });

  final String? code;
  final String? title;
  final String? message;
  final String? path;
  @JsonKey(name: 'original_error')
  final String? originalError;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  List<Object?> get props => [
    code,
    title,
    message,
    path,
    originalError,
  ];
}

