import 'auth_result_state.dart';

class MyAuthException {
  static handleException(e) {
    print(e.code);
    final errorCode =
        (e.code).toString().replaceAll("-", "_").toUpperCase().trim();
    AuthResultStatus status;
    switch (errorCode) {
      case "INVALID_EMAIL":
        status = AuthResultStatus.invalidEmail;
        break;
      case "WRONG_PASSWORD":
        status = AuthResultStatus.wrongPassword;
        break;
      case "USER_NOT_FOUND":
        status = AuthResultStatus.userNotFound;
        break;
      case "USER_DISABLED":
        status = AuthResultStatus.userDisabled;
        break;
      case "TOO_MANY_REQUESTS":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "OPERATION_NOT_ALLOWED":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "EMAIL_ALREADY_IN_USE":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case "WEAK_PASSWORD":
        status = AuthResultStatus.weakPassword;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Your email address appears to be badly format.";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Your password is wrong.";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "User with this email doesn't exist.";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "User with this email has been disabled.";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Too many requests. Try again later.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
            "The email has already been registered. Please login or reset your password.";
        break;
      case AuthResultStatus.weakPassword:
        errorMessage = "weak password. this password is so easy to guess.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }

    return errorMessage;
  }
}
