import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finfly/config/enums/enums.dart';

class AuthTypeCubit extends Cubit<AuthType> {
  AuthTypeCubit() : super(AuthType.login);

  changeAuthType(AuthType type) {
    emit(type);
  }
}
