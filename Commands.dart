// ###
// C => CLEAR
//  C
// T => TIMEOUT
//  T
// L => TURN ON LEDS
// LAR

// A / B / C
// R / G / B
class Commands {
  static String CLEAR = "C\n";
  static String TIMEOUT = "T\n";
  static String TURN_ON_LEDS = "L";
  static String BUTTON_SELECTED = "O";
  
  static String TURN_ON(String button, String rgb)  {
    return "${TURN_ON_LEDS}${button}${rgb}\n";
  }
  
  
}