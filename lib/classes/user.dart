/// In-app representation of the user
class User {

  // VARIABLES =================================================================


  // CONSTRUCTOR ===============================================================

  /// The value of the singleton.
  ///
  /// It is both static and final meaning it can only be instantiated once.
  static final User _instance = User._internal();

  /// Returns the unique instance of the class.
  factory User() => _instance;

  /// The actual constructor of the class.
  User._internal();

  // METHODS ===================================================================

}