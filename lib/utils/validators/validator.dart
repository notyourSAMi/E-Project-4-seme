

class AppValidator{
  static String? validateEmptyText(String? fieldName, String? value){
    if(value == null || value.isEmpty){
      return '$fieldName is required';
    }
    return null;
  }


  static String? validateEmail(String? email){
    if(email == null || email.isEmpty){
      return 'Email is required.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(email)){
      return 'Invalid email address.';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if(password == null || password.isEmpty){
      return 'Password is required';
    }
    if(password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    if(!password.contains(RegExp(r'[A-Z]'))){
      return 'Password must contain at least one uppercase letter.';
    }
    if(!password.contains(RegExp(r'[0-9]'))){
      return 'Password must contain at least one number.';
    }
    if(!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>-]'))) {
      return 'Password must contain at least one special character.';
    }
    return null;
  }

  static validatePhoneNumber(String? phoneNumber) {
    if(phoneNumber == null || phoneNumber.isEmpty){
      return 'Phone number is required';
    }
    final phoneRegExp = RegExp(r'^\d{10}$');
    if(!phoneRegExp.hasMatch(phoneNumber)){
      return 'Invalid phone number format (10 digits required).';
    }
    return null;
  }
}