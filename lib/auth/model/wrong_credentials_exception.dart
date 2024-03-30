class WrongCredentialsException implements Exception {

  final String message = 'Wrong credentials';

  @override
  String toString() {
    return message;
  }
}