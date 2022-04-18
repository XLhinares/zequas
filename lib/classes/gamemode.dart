/// The different possible gamemodes.
enum Gamemode {
  /// No game mode selected.
  none,

  // FRACTIONS -----------------------------------------------------------------
  /// Give fractions of form `a + b = x`
  fractionAddition,
  /// Give fractions of form `a * b = x`
  fractionMultiplication,
  /// Give fractions of form `a * b + c = x`
  fractionAll,

  // EQUATIONS -----------------------------------------------------------------
  /// Give equations of form `a + x = b`
  equationAddition,
  /// Give equations of form `a * x = b`
  equationMultiplication,
  /// Give equations of form `a * x + b = c`
  equationAll,

  // PERCENTAGE ----------------------------------------------------------------
  /// Give calculus like `a% of b`
  percentage,
  /// Give calculus like `a decreased/increased by b%`
  sale,
}

/// An extension on Gamemodes to be able to retrieve some details.
///
/// Handled details are:
/// - name: A name to display
/// - example: An example of the question included in the gamemode.
extension GamemodeRich on Gamemode {

  /// The name of the gamemode.
  String get name {
    switch (this) {
      // EQUATIONS -------------------------------------------------------------
      case Gamemode.fractionAddition:
        return "Additions";
      case Gamemode.fractionMultiplication:
        return "Multiplications";
      case Gamemode.fractionAll:
        return "Équations";
      // EQUATIONS -------------------------------------------------------------
      case Gamemode.equationAddition:
        return "Additions";
      case Gamemode.equationMultiplication:
        return "Multiplications";
      case Gamemode.equationAll:
        return "Équations";
      // PERCENTAGE ------------------------------------------------------------
      case Gamemode.percentage:
        return "Pourcentages";
      case Gamemode.sale:
        return "Promotions";
      default:
        return "Inconnu";
    }
  }

  /// The name of the gamemode.
  String get example {
    switch (this) {
      // EQUATIONS -------------------------------------------------------------
      case Gamemode.fractionAddition:
        return "A + B = C";
      case Gamemode.fractionMultiplication:
        return "A * B = C";
      case Gamemode.fractionAll:
        return "A + B * C = D";
      // EQUATIONS -------------------------------------------------------------
      case Gamemode.equationAddition:
        return "A + B = C";
      case Gamemode.equationMultiplication:
        return "A * B = C";
      case Gamemode.equationAll:
        return "A + B * C = D";
      // PERCENTAGE ------------------------------------------------------------
      case Gamemode.percentage:
        return "A% de B";
      case Gamemode.sale:
        return "A avec B% de promo";
      default:
        return "???";
    }
  }
}