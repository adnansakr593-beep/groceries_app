import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleSigninState {}

class GoogleSigninInitial extends GoogleSigninState {}

class GoogleSigninLoading extends GoogleSigninState {}

class GoogleSigninSuccess extends GoogleSigninState {
  final User? user;
  GoogleSigninSuccess(this.user);
}

class GoogleSigninFailure extends GoogleSigninState {
  final String error;
  GoogleSigninFailure(this.error);
}
