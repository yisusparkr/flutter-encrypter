part of 'utils.dart';

String encryptMessage( String message ) {
  final splittedWord = message.toLowerCase().split('');
  String encryptedMessage = '';

  splittedWord.forEach((value) {
    dictionary.forEach((key, keyValue) {
      if (value == key) encryptedMessage += keyValue;
    });
  });

  return encryptedMessage;

}