// To parse this JSON data, do
//
//     final failure = failureFromJson(jsonString);

import 'dart:convert';

Failure failureFromJson(String str) => Failure.fromJson(json.decode(str));

String failureToJson(Failure data) => json.encode(data.toJson());

class Failure {
  Failure({
    this.errorMessage,
  });

  String? errorMessage;

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        errorMessage:
            json["errorMessage"] == null ? null : json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "errorMessage": errorMessage,
      };
}