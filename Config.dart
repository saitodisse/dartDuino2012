/**
 *
 * Application configuration
 *
 **/
class Config {
  // arduino socket config
  static final String SOCKET_IP = "192.168.0.104";
  static final int SOCKET_PORT = 10002;
  
  // http servlet config
  static final String HTTP_HOST = "127.0.0.1";
  static final int HTTP_PORT = 9000;
  
  // log flag
  static final bool LOG = true;
  
  // tests without arduino connect
  static final bool ARDUINO_DISCONNECTED = true;
}
