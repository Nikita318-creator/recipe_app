class ErrorData {
  const ErrorData({required this.errorNumber});

  final String errorNumber;

  String getDescription() {
    switch (errorNumber) {
      case '400':
        return 'Bad Request, сервер обнаружил в запросе клиента синтаксическую ошибку';
      case '404':
        return 'The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible.';
      case '500':
        return 'Internal Server Error («внутренняя ошибка сервера»)';
      default:
        return 'Unknown ERROR';
    }
  }
}
