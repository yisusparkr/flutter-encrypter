import 'package:flutter/foundation.dart';
import 'package:encrypter/src/utils/utils.dart';

class DesencryptProvider with ChangeNotifier {

  bool _isDesencrypted = false;
  bool _errorOcurred = false;
  String _userInput = '';
  String _desencryptedMessage = '';
  String _errorMessage = '';

  String get userInput => this._userInput;

  set userInput( String message ) {
    this._userInput = message;
    notifyListeners();
  }

  bool get isDesencrypted => this._isDesencrypted;

  bool get errorOcurred => this._errorOcurred;

  String get errorMessage => this._errorMessage;

  String get desencryptedMessage => this._desencryptedMessage;


  void desencrypt() async {
    if ( userInput.isEmpty ) {
      _setErrorState('Write some text');
      return;
    }

    if ( userInput.contains(' ') ){
      _setErrorState('Don\'t use blank spaces');
      return;
    }

    try{
      final code = desencryptMessage(userInput);
      this._desencryptedMessage = code;
      this._isDesencrypted = true;
      notifyListeners();
    } catch(e){
      this._errorMessage = '$e';
      this._errorOcurred = true;
      notifyListeners();
    }

  }

  void resetState() {
    this._isDesencrypted = false;
    this._userInput = '';
  }

  void _setErrorState( String error ) async {
    this._errorOcurred = true;
    this._errorMessage = error;
    notifyListeners();
    await Future.delayed( const Duration( milliseconds: 10 ) );
    this._errorOcurred = false;
    this._isDesencrypted = false;
    this._desencryptedMessage = '';
    notifyListeners();
  }

}