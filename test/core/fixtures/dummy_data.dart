import 'package:clean_architecture/core/models/response.dart';
import 'package:clean_architecture/core/services/exception/http_exception.dart';
import 'package:clean_architecture/features/dashboard/models/user/user_model.dart';

import 'data/user_map.dart';

final AppException ktestAppException =
    AppException(message: '', statusCode: 0, identifier: '');

final User ktestUser = User.fromJson(const {});

final User ktestUserFromMap = User.fromJson(ktestUserMap);

final Response ktestUserResponse =
    Response(statusMessage: 'message', statusCode: 1, data: {});
