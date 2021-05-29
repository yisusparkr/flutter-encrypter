part of 'helpers.dart';

void showErrorMessage( BuildContext context, String message ) {
  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) { 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric( horizontal: 20.0 ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black87,
        width: 400.0,
        content: Row(
          children: [
            Icon(Icons.close, color: Colors.red),
            SizedBox( width: 10.0 ),
            Text(
              message,
              style: GoogleFonts.abel( fontSize: 18.0, color: Colors.white )
            )
          ],
        )
      )
    );
  });
}