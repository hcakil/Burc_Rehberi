import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_detay.dart';
import 'package:flutter_burc_rehberi/models/burc.dart';
import 'package:flutter_burc_rehberi/utils/strings.dart';

class BurcListe extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();

    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      //bodyi metodla yapmak istiyorum ama widget dondursun
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      //Eklenecek geçici Burç nesnesi
      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);

      //şimdide bunları yukarıdaki burclar listesine ekleyeceğiz
      burclar.add(eklenecekBurc);

    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oAnListeyeEklenenBurc = tumBurclar[index];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: ()=>Navigator.pushNamed(context, "/burcDetay/$index"),
          //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>BurcDetay())),
          leading: Image.asset(
            "images/" + oAnListeyeEklenenBurc.burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: Text(
            oAnListeyeEklenenBurc.burcAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade500),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: Text(
              oAnListeyeEklenenBurc.burcTarihi,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
