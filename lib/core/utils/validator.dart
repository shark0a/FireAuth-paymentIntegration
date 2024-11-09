abstract class ValiditorHelper {
  static String? validateEmailAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'email adress is required';
    } else if (!RegExp(r'^[A-Za-z0-9._+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
        .hasMatch(value)) {
      return 'Enter a valid email adress';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    // Add more checks as needed (e.g., special characters, uppercase letters)
    return null;
  }
}
