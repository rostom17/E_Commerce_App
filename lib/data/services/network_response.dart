class NetworkResponse {
  NetworkResponse({
    required this.statusCode,
    required this.isSuccessful,
    this.responseData,
    this.errorMessage = "Something Went Wrong",
  });

  final int statusCode;
  final bool isSuccessful;
  dynamic responseData;
  String errorMessage;
}
