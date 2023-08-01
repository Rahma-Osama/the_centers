abstract class AuthStatesQr{}

class IntialState extends AuthStatesQr{}
class QrLoadingState extends AuthStatesQr{}
class QrSuccessState extends AuthStatesQr{}
class QrFailedState extends AuthStatesQr{
  String ?message;
  QrFailedState({
    required this.message,
  });
}