import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/regestier_cubit/regestier_state.dart';

class RegestierCubit extends Cubit<RegisterStates> {
  RegestierCubit() : super(RegisterInitial());

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(RegisterWait());

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(RegisterSucss());
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFaliure(errmassege: 'Weak password'));
      } 
      else if (e.code == 'email-already-in-use') {
        emit(RegisterFaliure(
          errmassege: 'Email already in use. Try another account',
        ));
      } 
      else if (e.code == 'invalid-email') {
        emit(RegisterFaliure(
          errmassege: 'Invalid email format',
        ));
      }
      else if (e.code == 'operation-not-allowed') {
        emit(RegisterFaliure(
          errmassege: 'Email/password accounts are disabled in Firebase',
        ));
      }
      else {
        emit(RegisterFaliure(
          errmassege: 'Unexpected error: ${e.code}',
        ));
      }
    }
  }
}
