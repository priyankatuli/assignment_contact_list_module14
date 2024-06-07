import 'package:assignment_contact_list_module14/contact_screen.dart';
import 'package:flutter/material.dart';

class ContactApp extends StatelessWidget{
  const ContactApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     // locale: DevicePreview.locale(context),
      //builder: DevicePreview.appBuilder,
      home: const ContactScreen(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              elevation: 0.0,
              backgroundColor: Colors.blueGrey.shade300,
              foregroundColor: Colors.white,
              toolbarHeight: 100,
              centerTitle: true
          ),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.blueGrey,width: 1)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.greenAccent,width: 1),
                  borderRadius: BorderRadius.circular(5)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.redAccent,width: 1),
                  borderRadius: BorderRadius.circular(5)
              ),
            errorBorder:  OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red,width: 1),
                borderRadius: BorderRadius.circular(5)
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size.fromWidth(double.maxFinite),
                //padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),


              )
          )


      ),
    );
  }
}