import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id);

  final String id;
  final String name = 'Stefano';
  final int age = 23;
  final int credits = 100;

  @override
  List<Object> get props => [id, name, age, credits];

  static const empty = User('-');
}
