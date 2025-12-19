abstract class SiginState {}

class SiginInitial extends SiginState{}
class SiginSucss extends SiginState{}
class SiginLoading extends SiginState{}
class SiginFaliure extends SiginState
{
  String errmassege;

  SiginFaliure({required this.errmassege});
}