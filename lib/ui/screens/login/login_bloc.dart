import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:perfume_shop/data/models/login_model.dart';
import 'package:perfume_shop/data/repositories/repository.dart';
import 'package:perfume_shop/services/secure_storage_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Repository _repository;
  final SecureStorageService _storage = SecureStorageService();

  LoginBloc(this._repository) : super(LoginInitial()) {
    on<LoginbuttonPressed>(_onloginPressed);
  }
  Future<void> _onloginPressed(
    LoginbuttonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoader());
    try {
      LoginModel response = await _repository.login(
        event.deviceToken,
        event.deviceType,
      );
      if (response.message == "Success") {
        if (response.data?.accessToken != null) {
          await _storage.saveToken(response.data!.accessToken!.toString());
        }
        emit(LoginSuccess());
      } else {
        emit(
          LoginFailure(
            error: response.message ?? "Something went wrong, Try again.",
          ),
        );
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
