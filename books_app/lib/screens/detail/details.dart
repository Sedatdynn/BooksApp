import 'package:books_app/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DetailScreen());
}

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        title: Text("Details Page"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, right: 15.0, left: 15.0, bottom: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                child: Card(
                  shadowColor: Colors.teal.shade700,
                  child: Image.asset(
                    "assets/book.jpg",
                    fit: BoxFit.cover,
                  ),
                  elevation: 8.0,
                  //  shape: CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 14.0, left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Sabahattin Ali - Kürk Mantolu Madonna" +
                              " |" +
                              " 25£",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Text(
                  "Her gün, daima öğleden sonra oraya gidiyor, koridorlardaki resimlere bakıyormuş gibi ağır ağır, fakat büyük bir sabırsızlıkla asıl hedefine varmak isteyen adımlarımı zorla zapt ederek geziniyor, rastgele gözüme çarpmış gibi önünde durduğum Kürk Mantolu Madonnayı seyre dalıyor, ta kapılar kapanıncaya kadar orada bekliyordum.Kimi tutkular rehberimiz olur yaşam boyunca. Kollarıyla bizi sarar. Sorgulamadan peşlerinden gideriz ve hiç pişman olmayacağımızı biliriz. Yapıtlarında insanların görünmeyen yüzlerini ortaya çıkaran Sabahattin Ali, bu kitabında güçlü bir tutkunun resmini çiziyor. Düzenin sildiği kişiliklere, yaşamın uçuculuğuna ve aşkın olanaksızlığına (?) dair, yanıtlanması zor sorular soruyor.Bir kitabı okurken geçen iki saatin, ömrümün birçok senelerinden daha dolu, daha ehemmiyetli olduğunu fark edince, insan hayatının ürkütücü hiçliğini düşünür ve yeis içinde kalırdım. Türk yazar ve şair Sabahattin Ali'nin Kürk Mantolu Madonna kitabı, adıyla efsaneleşen unutulmaz eserlerden biri. Türk edebiyatının baş yapıtları arasında yer alan bu ünlü eser, unutulmaz karakterleri Maria Puder ve Raif Efendi'nin olanaksız ama bir o kadar da tutkulu aşkını konu alır. ",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
