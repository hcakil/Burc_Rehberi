import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_detay.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';


void main()=> runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/burcListe",
      routes: {
        "/":(context)=>BurcListe(),
        "/burcListe":(context)=>BurcListe(),
       // "/burcDetay/$index":(context)=>BurcDetay(),
      },

      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari=settings.name.split("/"); // /lara göre ayırıyoruz
        if(pathElemanlari[1]=='burcDetay'){
            return MaterialPageRoute(builder: (context)=>BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      title: "Burç Rehberi",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),

    );
  }
}