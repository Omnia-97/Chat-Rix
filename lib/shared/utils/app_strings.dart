class AppStrings {
  static const String createAccount = 'Create Account';
  static const String yourName = 'Your Name';
  static const String email = 'Email Address';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String signUp = 'Sign Up';
  static const String happy = 'I wish you a happy experience';
  static const String orSignUpWith = 'Or sign up with';
  static const String error = 'Something went wrong';
  static const String tryAgain = 'Try Again';
  static const String cancel = 'Cancel';
  static const String validatePassword =
      'Invalid password \n* the password must be Minimum eight characters,\n* at least one uppercase letter,\n* one lowercase letter,\n* one number and one special character';
  static const String emailPattern =
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  static const String passPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  static const String welcomeBack = 'Welcome Back!';
  static const String missed = 'welcome back we missed you';
  static const String forgotPassword = 'Forgot Password?';
  static const String signIn = 'Sign In';
  static const String orContinueWith = 'Or continue with';
  static const String dontHaveAccount = 'Don’t have an account?';
  static const String register = 'Register';
}
