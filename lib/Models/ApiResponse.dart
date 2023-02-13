class ApiResponse {
  String title = "";
  String message = "";
  bool success = false;
  dynamic response;

  ApiResponse({
    required this.title,
    required this.message,
    required this.success,
    this.response,
  });

  String getTitle() => title;
  String getMessage() => message;
  bool isSuccess() => success;
  dynamic getResponse() => response;
}
