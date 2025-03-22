class Validators {
  Validators._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null) {
      return 'this field is required';
    } else if (val.trim().isEmpty) {
      return 'this field is required';
    } else if (emailRegex.hasMatch(val) == false) {
      return 'enter valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (val == null) {
      return 'this field is required';
    } else if (val.isEmpty) {
      return 'this field is required';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'strong password please';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (val != password) {
      return 'same password';
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null) {
      return 'this field is required';
    } else if (val.isEmpty) {
      return 'this field is required';
    } else if (!usernameRegex.hasMatch(val)) {
      return 'enter valid username';
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else {
      return null;
    }
  }

  static String? validateAddress(String? val) {
    RegExp addressRegex = RegExp(
        r'^\d{1,5}\s[A-Za-z\s\-\/]+(?:\s[A-Za-z\s\-\/]+)?(?:\s*\s*[A-Za-z\s\-\/]+){0,2}$');
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (!addressRegex.hasMatch(val)) {
      return 'enter valid address';
    } else {
      return null;
    }
  }

  static String? validateCreditNum(String? val) {
    RegExp creditCardRegex = RegExp(
        r'^(?:4[0-9]{3}[-\s]?[0-9]{4}[-\s]?[0-9]{4}[-\s]?[0-9]{1,4}|5[1-5][0-9]{2}[-\s]?[0-9]{4}[-\s]?[0-9]{4}[-\s]?[0-9]{4}|3[47][0-9]{2}[-\s]?[0-9]{6}[-\s]?[0-9]{5}|6(?:011|5[0-9]{2})[-\s]?[0-9]{4}[-\s]?[0-9]{4}[-\s]?[0-9]{4})$');
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (!creditCardRegex.hasMatch(val)) {
      return 'enter valid Credit Card Number';
    } else {
      return null;
    }
  }
  static String? validateExpiration(String? val) {
    RegExp expirationDateRegex = RegExp(r'^(0[1-9]|1[0-2])[\/\-][0-9]{2}$');
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (!expirationDateRegex.hasMatch(val)) {
      return 'enter valid Expiration Date';
    } else {
      return null;
    }
  }
  static String? validateCvv(String? val) {
    RegExp cvvRegex = RegExp(r'^[0-9]{3,4}$');
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (!cvvRegex.hasMatch(val)) {
      return 'enter valid CVV';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null) {
      return 'this field is required';
    } else if (int.tryParse(val.trim()) == null) {
      return 'enter numbers only';
    } else if (val.trim().length != 11) {
      return 'enter value must equal 11 digit';
    } else {
      return null;
    }
  }
}
