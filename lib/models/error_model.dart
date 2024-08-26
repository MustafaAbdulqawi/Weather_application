class ErrorModel {
  Error error;

  ErrorModel({
    required this.error,
  });

  factory ErrorModel.fromJson( json) => ErrorModel(
        error: Error.fromJson(json["error"]),
      );
}

class Error {
  int code;
  String message;

  Error({
    required this.code,
    required this.message,
  });

  factory Error.fromJson( json) => Error(
        code: json["code"],
        message: json["message"],
      );
}
