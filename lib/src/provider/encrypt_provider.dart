import 'package:flutter/foundation.dart';
import 'package:encrypter/src/utils/utils.dart';

class EncryptProvider with ChangeNotifier {

  bool _isEncrypted = false;
  bool _errorOcurred = false;
  String _userInput = '';
  String _encryptedMessage = '';
  String _errorMessage = '';

  String get userInput => this._userInput;

  set userInput( String message ) {
    this._userInput = message;
    notifyListeners();
  }

  bool get isEncrypted => this._isEncrypted;

  bool get errorOcurred => this._errorOcurred;

  String get errorMessage => this._errorMessage;

  String get encryptedMessage => this._encryptedMessage;


  void encrypt() async {
    if ( userInput.isEmpty ) {
      this._errorOcurred = true;
      this._errorMessage = 'Write some text';
      notifyListeners();
      await Future.delayed( const Duration( milliseconds: 10 ) );
      this._errorOcurred = false;
      this._isEncrypted = false;
      this._encryptedMessage = '';
      notifyListeners();
      return;
    }

    try{
      final code = encryptMessage(userInput);
      this._encryptedMessage = code;
      this._isEncrypted = true;
      notifyListeners();
    } catch(e){
      this._errorMessage = '$e';
      this._errorOcurred = true;
      notifyListeners();
    }

  }

  void resetState() {
    this._isEncrypted = false;
    this._userInput = '';
  }


}