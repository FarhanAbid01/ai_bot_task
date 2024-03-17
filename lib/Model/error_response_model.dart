class ErrorResponseModel {
  int customErrorNumber;
  int status;
  String message;

  ErrorResponseModel(this.customErrorNumber, this.status, this.message);

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
        json['status_code'], json['status'], json['message']);
  }
}