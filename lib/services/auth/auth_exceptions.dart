// login exceptions

class UserNotFoundAuthExecption implements Exception {}

// register exceptions

class WeakPasswordAuthExecption implements Exception {}

class InvalidEmailAuthExecption implements Exception {}

class EmailAlreadyInUseAuthExecption implements Exception {}

// generic exceptions

class GenericAuthException implements Exception {}

class UserNotLogInAuthException implements Exception {}
