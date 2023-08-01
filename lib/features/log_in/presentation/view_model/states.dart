abstract class AuthStates{}

class IntialState extends AuthStates{}
class LogInLoadingState extends AuthStates{}
class LogInSuccessState extends AuthStates{}
class LogInFailedState extends AuthStates{
  String ?message;
  LogInFailedState({
    required this.message,
  });
}