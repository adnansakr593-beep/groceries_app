import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/sigin_cubit/sigin_state.dart';

class SiginCubit extends Cubit <SiginState>{
  SiginCubit() : super(SiginInitial());

  Future<void> firebaseauthmethod({required String email, required String password}) async {
    emit(SiginLoading());
    try {
      var auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      emit(SiginSucss());
      // ignore: unused_catch_clause
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SiginFaliure(errmassege: 'No user found for this email'));
      } else if (e.code == 'wrong-password') {
        emit(SiginFaliure(errmassege: 'Wrong password provided'));
      } else {
        emit(SiginFaliure(errmassege: 'Error: ${e.code}'));
      }
    }
}

}
