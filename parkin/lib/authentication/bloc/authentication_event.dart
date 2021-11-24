import 'package:equatable/equatable.dart';
import 'package:parkin/authentication_repository.dart';

// AuthenticationEvent instances will be the input to the AuthenticationBloc
// and will be processed and used to emit new AuthenticationState instances.

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
