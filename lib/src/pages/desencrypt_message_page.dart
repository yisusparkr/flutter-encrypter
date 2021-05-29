import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:encrypter/src/helpers/helpers.dart' as helpers;
import 'package:encrypter/src/provider/desencrypt_provider.dart';
import 'package:encrypter/src/constants/constants.dart' as constants;

class DesencryptMessagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            splashRadius: 25.0,
            icon: Icon(Icons.arrow_back_ios_rounded, size: 30.0),
            onPressed: (){
              Navigator.pop(context);
              Provider.of<DesencryptProvider>(context, listen: false).resetState();
            }, 
          ),
        ),
        body: Consumer<DesencryptProvider>(
          builder: ( _ , state, __ ) {
            if( state.errorOcurred ) helpers.showErrorMessage(context, state.errorMessage);
            return _Body();
          },
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: constants.dictionaryText,
          mini: true,
          backgroundColor: Colors.blue,
          child: Icon(Icons.info_outline, color: Colors.white),
          onPressed: () => helpers.showCommonDialog(context, true)
        ),
      ),
    );
  }

}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final desencryptProvider = Provider.of<DesencryptProvider>(context);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric( horizontal: 20.0 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              constants.desencryptPageTitle,
              style: GoogleFonts.abel( fontSize: 35.0, fontWeight: FontWeight.w400 ),
            ),
            SizedBox( height: 30.0 ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 500.0,
                minWidth: 400.0
              ),
              child: TextField(
                maxLines: 1,
                enableSuggestions: true,
                style: TextStyle(
                  fontSize: 20.0
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0) ),
                  labelText: 'Code'
                ),
                onChanged: ( value ) => desencryptProvider.userInput = value,
              ),
            ),
            SizedBox( height: 30.0 ),
            MaterialButton(
              elevation: 0.0,
              height: 60.0,
              minWidth: 300.0,
              color: Colors.blue,
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0) ),
              child: Text(
                constants.desencryptText,
                style: TextStyle( fontSize: 20.0 ),
              ),
              onPressed: () => desencryptProvider.desencrypt()
            ),
            SizedBox( height: 60.0 ),
            AnimatedSwitcher(
              duration: const Duration( milliseconds: 200 ),
              child: ( desencryptProvider.isDesencrypted ) 
                ? Column(
                  children: [
                    SelectableText(
                      constants.desencryptPageResultText,
                      style: GoogleFonts.abel( fontSize: 30.0, fontWeight: FontWeight.w400 ),
                    ),
                    SizedBox( height: 15.0 ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 500.0,
                        minWidth: 400.0
                      ),
                      child: SelectableText(
                        desencryptProvider.desencryptedMessage,
                        style: GoogleFonts.koHo( fontSize: 18.0 ),
                      ),
                    )
                  ],
                )
            : SizedBox()
            ),
          ],
        ),
      ),
    );
  }
}