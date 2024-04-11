class NoColorException implements Exception {
  final String message;

  NoColorException(this.message);

  @override
  String toString() {
    return 'NoColorException: $message';
  }
}