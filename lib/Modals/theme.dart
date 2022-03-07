import 'package:flutter/material.dart';

CustomTheme currenttheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool isDarkTheme = false;
  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
       cardColor:  Colors.blue[100],
    accentColor: Color.fromRGBO(255, 139, 167, 1),
      scaffoldBackgroundColor: Colors.white,  //Color.fromRGBO(243, 210, 193, 1),
        primaryColor: Color.fromRGBO(139, 211, 221, 0.9),
        textTheme: TextTheme(
            headline1: TextStyle(
                fontFamily: 'Lato',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 24, 88, 1),),
                headline2: TextStyle(
                fontFamily: 'Lato',
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black),
                
                ),
        buttonTheme:ButtonThemeData(
          buttonColor: Color.fromRGBO(139, 211, 221, 1)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary:  Color.fromRGBO(139, 211, 221, 1),
          )
        ),
        textButtonTheme: TextButtonThemeData(style: 
        TextButton.styleFrom(
          primary:  Color.fromRGBO(139, 211, 221, 1),
        )
        ),
        
                
                
                );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Color.fromRGBO(30, 31, 33, 1),
        accentColor: Color.fromRGBO(63, 63, 65, 1.5),
        scaffoldBackgroundColor: Color.fromRGBO(63, 63, 65, 1),
        textTheme: TextTheme(
            headline1: TextStyle(
                fontFamily: 'Lato',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white)
                ,bodyText1: TextStyle(
                fontFamily: 'Lato',
                fontSize: 15,
                
                color: Colors.black)
                ),
                cardColor: Color.fromRGBO(63, 63, 65, 1.5),
               
               
                );
                

                
  }
}
