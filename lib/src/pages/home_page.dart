import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:encrypter/src/pages/encrypt_message_page.dart';
import 'package:encrypter/src/pages/desencrypt_message_page.dart';
import 'package:encrypter/src/constants/constants.dart' as constants;

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 50.0,
                runSpacing: 30.0,
                children: [
                  _DescriptionContainer(
                    title: constants.encrypTitle,
                    description: constants.encrypDescription,
                    route: 'encrypt-message',
                    page: EncryptMessagePage()
                  ),
                  _DescriptionContainer(
                    title: constants.deencrypTitle,
                    description: constants.desencrypDescription,
                    route: 'desencrypt-message',
                    page: DesencryptMessagePage()
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}

class _DescriptionContainer extends StatelessWidget {

  final String title;
  final String description;
  final String route;
  final Widget page;

  const _DescriptionContainer({
    Key? key, 
    required this.title, 
    required this.description,
    required this.route,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final screenSize = MediaQuery.of(context).size;
    final containerHeight = ( screenSize.width < 768 ) ? 375.0 : 525.0;
    final containerWidth = ( screenSize.width < 768 ) ? 350.0 : 450.0;
    final titleSize = ( screenSize.width < 768 ) ? 35.0 : 45.0;
    final buttonHeight = ( screenSize.width < 768 ) ? 60.0 : 70.0;
    final buttonWidth = ( screenSize.width < 768 ) ? containerWidth - 100 : containerWidth - 150;
    double descriptionSize = ( screenSize.width < 768 ) ? 25.0 : 35.0; 

    if ( screenSize.width < 375 ) descriptionSize = 20.0;

    return Container(
      padding: const EdgeInsets.all(20.0),
      height: containerHeight,
      width: containerWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(this.title, style: GoogleFonts.abel( fontSize: titleSize, fontWeight: FontWeight.w500 )),
          Divider(
            color: Colors.blueGrey,
          ),
          SelectableText(
            this.description,
            style: GoogleFonts.koHo( fontSize: descriptionSize, fontWeight: FontWeight.w300 ),
          ),
          Spacer(),
          Center(
            child: MaterialButton(
              elevation: 0.0,
              height: buttonHeight,
              minWidth: buttonWidth,
              color: Colors.blue,
              hoverColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                'Try it',
                style: TextStyle( fontSize: descriptionSize - 5, fontWeight: FontWeight.w300 ),
              ),
              onPressed: () => Navigator.push(
                context, CupertinoPageRoute(
                  settings: RouteSettings(
                    name: this.route
                  ),
                  builder: ( _ ) => this.page
                )
              )
            ),
          ),
          Spacer()
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.white70
        )
      ),
    );
  }
}