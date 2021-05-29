part of 'utils.dart';

String desencryptMessage( String message ) {
  int initialPos = 0;
  int finalPos = 3;
  String desencryptedMessage = '';

  message = message.toLowerCase();

  // ignore: unnecessary_statements
  for( finalPos = 3; finalPos <= message.length; finalPos ){

    final code = message.substring(initialPos, finalPos);
    final character = _getCharacter(code, dictionary);
    desencryptedMessage += character;

    initialPos += 3;
    finalPos += 3;
  }

  return desencryptedMessage;

}

String _getCharacter( String code, Map<String, String> dictionary ) {
  String character = '';
  
  dictionary.forEach((key, value) { 
    if( code == value ) character = key;
  });

  return character;
}