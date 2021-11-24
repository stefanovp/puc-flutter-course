import 'package:equatable/equatable.dart';
import 'package:parkin/authentication_repository.dart';
import 'package:parkin/models/user.dart';

// AuthenticationState instances will be the output of the AuthenticationBloc
// and will be consumed by the presentation layer.

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}