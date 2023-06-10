/// to learn more about [Extension] methods follow https://dart.dev/guides/language/extension-methods
/// to check Regex use this website https://regex101.com/ [remove [r'']]

extension EmailValidator on String {
  bool isValidEmail() {
    //todo replace "trim()" with "this" if space is not allowed.
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(trim());
  }
}

/// Follow [APIConflicts] area  if any conflicts occurs
extension PhoneValidator on String {
  bool isValidPhone() {
    return RegExp(
            r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
        .hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    //todo for strong password
    /*  return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,20}$)')
        .hasMatch(this);*/
    // Minimum eight and maximum 10 characters, at least one uppercase letter,
    // one lowercase letter, one number and one special character.
    return /*RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%#*?&])[A-Za-z\d@$!%#*?&]{8,20}$')*/
        /*RegExp(r'^[a-zA-Z0-9]+$')*/

        RegExp(r'^.{8,}$').hasMatch(this);

    // return RegExp(r'^[0-9a-zA-Z]{4,20}').hasMatch(this);
  }
}

/// [Explanation] of this [RegExp] bellow
/*1st Capturing Group (^([+]{1}[8]{2}|88)?(01){1}[3-9]{1}\d{8})
^ asserts position at start of a line
2nd Capturing Group ([+]{1}[8]{2}|88)?
? matches the previous token between zero and one times, as many times as possible, giving back as needed (greedy)
1st Alternative [+]{1}[8]{2}
Match a single character present in the list below [+]
{1} matches the previous token exactly one time (meaningless quantifier)
+ matches the character + with index 4310 (2B16 or 538) literally (case sensitive)
Match a single character present in the list below [8]
{2} matches the previous token exactly 2 times
8 matches the character 8 with index 5610 (3816 or 708) literally (case sensitive)
2nd Alternative 88
88 matches the characters 88 literally (case sensitive)
3rd Capturing Group (01){1}
{1} matches the previous token exactly one time (meaningless quantifier)
A repeated capturing group will only capture the last iteration. Put a capturing group around the repeated group to capture all iterations or use a non-capturing group instead if you're not interested in the data
01 matches the characters 01 literally (case sensitive)
Match a single character present in the list below [3-9]
{1} matches the previous token exactly one time (meaningless quantifier)
3-9 matches a single character in the range between 3 (index 51) and 9 (index 57) (case sensitive)
\d matches a digit (equivalent to [0-9])
{8} matches the previous token exactly 8 times
$ asserts position at the end of a line*/
extension PhoneValidatorBD on String {
  /// expression 1: ^((01)[3-9]{1}[0-9]{8}$)
  bool isValidBDPhoneNum() {
    return RegExp(r'(^([+]{1}[8]{2}|88)?(01){1}[3-9]{1}\d{8})$').hasMatch(this);
  }
}

extension NidValidatorBD on String {
  bool isValidBDNid() {
    return RegExp(r'(^[0-9]{10}$|^[0-9]{13}$|^[0-9]{17}$)$').hasMatch(this);
  }
}

extension BirthRegistrationValidatorBD on String {
  bool isValidBDBirthRegistration() {
    return RegExp(r'(^[0-9]{17}$)$').hasMatch(this);
  }
}
