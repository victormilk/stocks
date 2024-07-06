import 'package:equatable/equatable.dart';
import 'package:stocks_core/src/utils/log_utils.dart';

class ServerException with EquatableMixin implements Exception {
  ServerException({
    required this.message,
    required this.statusCode,
  }) {
    LogUtils.logException(error: this);
  }

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheException with EquatableMixin implements Exception {
  CacheException({
    required this.message,
  }) {
    LogUtils.logException(error: this);
  }

  final String message;

  @override
  List<Object?> get props => [message];
}
