abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}
class RegisterSucss   extends RegisterStates {}
class RegisterWait    extends RegisterStates {}
class RegisterFaliure extends RegisterStates 
{
  String errmassege;

  RegisterFaliure({required this.errmassege});
}