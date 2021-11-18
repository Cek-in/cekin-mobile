import 'package:logger/logger.dart';

class Log {
  static Log i = Log._();

  final Logger _logger = Logger();

  Log._();

  void info(message) => _logger.i(message);

  void warn(message) => _logger.w(message);

  void error(message) => _logger.e(message);
}
