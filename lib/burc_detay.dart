import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'package:palette_generator/palette_generator.dart';

import 'models/burc.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secilenBurc = BurcListe.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul(){
    Future<PaletteGenerator> fPaletGenerator=PaletteGenerator.fromImageProvider(AssetImage("images/"+secilenBurc.burcBuyukResim));
    fPaletGenerator.then((value){
      paletteGenerator=value;

      setState(() {
        baskinRenk=paletteGenerator.dominantColor.color;
      });

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      primary: false,
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: baskinRenk != null? baskinRenk: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(secilenBurc.burcAdi + " Burcu ve Özellikleri"),
              background: Image.asset(
                "images/" + secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SingleChildScrollView(
                child: Text(
                  secilenBurc.burcDetay,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
