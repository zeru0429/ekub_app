String extractErrorMessage(String exceptionString) {
  final errorMessage = exceptionString.split(': ').last;
  return errorMessage;
}
