import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkin/authentication/bloc/authentication_bloc.dart';
import 'package:parkin/authentication/bloc/authentication_event.dart';
import 'package:parkin/ticket/tickets_page.dart';

class ProfilePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
              context.select((AuthenticationBloc bloc) => bloc.state.user.id))),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                final userId = context.select(
                  (AuthenticationBloc bloc) => bloc.state.user.id,
                );
                return Text('UserID: $userId');
              },
            ),
            Builder(
              builder: (context) {
                final userName = context.select(
                  (AuthenticationBloc bloc) => bloc.state.user.name,
                );
                return Text('Name: $userName');
              },
            ),
            Builder(
              builder: (context) {
                final userAge = context.select(
                  (AuthenticationBloc bloc) => bloc.state.user.age,
                );
                return Text('Age: $userAge');
              },
            ),
            Builder(
              builder: (context) {
                final userCredits = context.select(
                  (AuthenticationBloc bloc) => bloc.state.user.credits,
                );
                return Text('Credits: $userCredits');
              },
            ),
            ElevatedButton(
              child: const Text('My Tickets'),
              onPressed: () {
                var route = MaterialPageRoute(
                    builder: (BuildContext context) => TicketsPage());
                Navigator.of(context).push((route));
              },
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
