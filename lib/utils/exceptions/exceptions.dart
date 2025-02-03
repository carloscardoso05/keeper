class KeeperException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  KeeperException(this.message, [this.stackTrace]);

  @override
  String toString() {
    if (stackTrace != null) {
      return '$runtimeType: $message\n$stackTrace';
    }
    return '$runtimeType: $message';
  }
}
