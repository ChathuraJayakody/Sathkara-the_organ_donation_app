import 'package:flutter/material.dart';

ThemeData LightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade400,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
  ),
);

ThemeData DarkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
);

/*
====== with the code ========

 backgroundColor : Theme.of(context).colorScheme.background,
 color : Theme.of(context).colorScheme.primary
 color : Theme.of(context).colorScheme.secondary

============= main =============
void main(){
  ChangeNotifyProvider{(
    create: (context) => ThemeProvider(),
    child: MyApp(),
    )
  };
}

class MtApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowcheckedModeBanner : false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    )
  }
}

========= Button=======
 ontap(){
  Provider.of<ThemeProvider>(context,Listen: false).toogleTheme();
 }

*/