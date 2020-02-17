// Basic regular expressions for validating strings
final emailPattern =
    r'^[a-zA-Z0-9](([.]{1}|[_]{1})?[a-zA-Z0-9])*[@]([a-z0-9]+([.]{1}|-)?)*[a-zA-Z0-9]+[.]{1}[a-z]{2,253}$';

bool isMatchedPattern(String pattern, dynamic input) {
  if (!RegExp(pattern).hasMatch(input)) {
    return false;
  }

  return true;
}

class Validator {
  static bool isEmpty(String input) {
    if (input == null || input.isEmpty) {
      return false;
    }

    return true;
  }

  static bool isEmail(String email) {
    if (email.isEmpty ||
        email.length < 6 ||
        !isMatchedPattern(emailPattern, email)) {
      return false;
    }

    return true;
  }

  static bool isPassword(String password) {
    if (password.isEmpty || password.length < 6) {
      return false;
    }

    return true;
  }
}

