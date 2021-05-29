part of 'helpers.dart';

void showCommonDialog( BuildContext context, bool reversedDictionary ) async {
  await showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        titleTextStyle: GoogleFonts.abel( fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w400 ),
        title: Text('Dictionary'),
        content: Container(
          height: 300.0,
          width: 200.0,
          child: ListView.builder(
            itemCount: dictionary.length,
            itemBuilder: ( _ , index ) {
              List<String> codes = [];
              dictionary.forEach((key, value) { 
                if ( !reversedDictionary ) codes.add('$key   =   $value');
                else codes.add('$value   =   $key');
              });
              return SelectableText(
                '${codes[index]}',
                style: GoogleFonts.koHo( fontSize: 20.0, fontWeight: FontWeight.w300 ),
              );
            },
          ),
        ),
      );
    },
  );
}