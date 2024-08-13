import 'package:flutter_admin/base/base_service.dart';
import 'package:flutter_admin/core/utils/logger_utils.dart';
import 'package:get_it/get_it.dart';

class BaseServiceImpl implements BaseService {
  BaseServiceImpl();
  final LoggerUtils loggerUtils = GetIt.instance<LoggerUtils>();
}
