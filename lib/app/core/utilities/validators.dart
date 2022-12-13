class Validators {
  static bool confirmPasswordValidator(
      String password, String confirmPassword) {
    return (password == confirmPassword);
  }
}
