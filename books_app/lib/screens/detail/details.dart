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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage("assets/book.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Sabahattin Ali - Kürk Mantolu Madonna" + " |" + " 25£",
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
            child: Text(
                "Her gün, daima öğleden sonra oraya gidiyor, koridorlardaki resimlere bakıyormuş gibi ağır ağır, fakat büyük bir sabırsızlıkla asıl hedefine varmak isteyen adımlarımı zorla zapt ederek geziniyor, rastgele gözüme çarpmış gibi önünde durduğum Kürk Mantolu Madonnayı seyre dalıyor, ta kapılar kapanıncaya kadar orada bekliyordum.Kimi tutkular rehberimiz olur yaşam boyunca. Kollarıyla bizi sarar. Sorgulamadan peşlerinden gideriz ve hiç pişman olmayacağımızı biliriz. Yapıtlarında insanların görünmeyen yüzlerini ortaya çıkaran Sabahattin Ali, bu kitabında güçlü bir tutkunun resmini çiziyor. Düzenin sildiği kişiliklere, yaşamın uçuculuğuna ve aşkın olanaksızlığına (?) dair, yanıtlanması zor sorular soruyor.Bir kitabı okurken geçen iki saatin, ömrümün birçok senelerinden daha dolu, daha ehemmiyetli olduğunu fark edince, insan hayatının ürkütücü hiçliğini düşünür ve yeis içinde kalırdım. Türk yazar ve şair Sabahattin Ali'nin Kürk Mantolu Madonna kitabı, adıyla efsaneleşen unutulmaz eserlerden biri. Türk edebiyatının baş yapıtları arasında yer alan bu ünlü eser, unutulmaz karakterleri Maria Puder ve Raif Efendi'nin olanaksız ama bir o kadar da tutkulu aşkını konu alır. Türk edebiyat tarihinde toplumcu gerçekçi bir edebi kişiliğe sahip olması ile bilinen Sabahattin Ali, ağırlıklı olarak öykü türünde eserler yazmasının yanı sıra romancı kişiliği ile de biliniyor. Edebiyat dünyasına kazandırdığı, tasvirleri ve yoğun anlatımıyla öne çıkan Kürk Mantolu Madonna kitabı, sevgi ve aşk konusunun yanı sıra modern şehir hayatında silikleşen kişilikler gibi sosyolojik sorunlara da eğilir. Kitabın ana karakteri olan Raif Efendi'nin duygularının uzun tasvirler ile dile getirildiği, Maria Puder'e olan tutkusunun okuyucuyu adeta sarıp sarmaladığı ve bu tutku dolu hikayenin okuyucusunu içine çektiği Kürk Mantolu Madonna, Sabahattin Ali tarafından askerlik döneminde yazılır. Bu dönemde attan düşerek bileğini çatlatan yazar, buna rağmen yazısına ara vermemiştir. 1940 yılında Hakikat gazetesi tarafından “Büyük Hikaye” başlığı altında 48 bölüm olarak yayımlanan roman, daha sonra 1943 yılında ilk kez kitap haline getirilir. Sabahattin Ali her zaman öykü ve romanlarındaki karakterlerin tanınan, bilinen canlı karakterler olması gerektiğini savunur. Bu sayede karakterler tıpkı Kürk Mantolu Madonna'da olduğu gibi üzerinden yıllar geçse bile hatırlanacaktır. Eserleri ile kalıcı olmayı ilke edinen Sabahattin Ali'nin romanları, okuyucunun aşina olduğu ve hiç bir zaman güncelliğini yitirmeyecek konular üzerine kurulur. Hikayelerinde çoğunlukla kırsal yaşamı ve karakterlerin yaşamakta olduğu sosyo-ekonomik güçlükleri vurgulayan yazar, dilde sadelik düşüncesini de tüm eserlerine yansıtır. Sabahattin Ali'nin eserlerinde hikayenin gerçekleştiği mekan, aynı zamanda kişilerin karakterini de belirler. Kürk Mantolu Madonna kitabı Almanya'nın Berlin kentinden Ankara'ya kadar devam eden bir hikayeyi konu alır. Romanın temelini Maria Puder ve Raif Efendi karakterleri oluşturur. Raif Efendi, içine kapanık, sessiz ve melankolik bir adam olmakla birlikte karşılaştığı haksızlıklara boyun eğen, karşı koyamayan silik bir karakteri yansıtır. Kürk Mantolu Madonna, sevmediği bir kadın ile evlenen Raif Efendi'nin hayatını derinden etkileyen unutulmaz bir anıyı konu alır. Bu konunun baş kahramanı ise hiç kuşkusuz Maria Puder isimli kadındır. Berlin'deki yaşamı boyunca sanata olan ilgisini kaybetmeyen Raif Efendi, bir sanat galerisinde karşılaştığı tabloya hayranlık duyar. Uzun bir süre zarfı boyunca yalnızca tabloyu seyretmek için gittiği bu galerinin, unutamayacağı bir anının da başlangıç yeri olacağından habersizdir. Raif Efendi'nin bu tabloya duyduğu hayranlık ve gerçekleştirdiği sık ziyaretler, galeride bulunan başka birinin de ilgisini çeker. Bu kişi, Raif Efendi'ye kendini tanıttığında ise onlar için geri dönüşü olmayan bir hikaye başlar. Tablonun sahibi romanın diğer ana karakteri Maria Puder'den başkası değildir. 2016 yılı başında İngiliz yayıncı Penguin’in Modern Klasikler serisi arasında da yerini alan Kürk Mantolu Madonna, 73 yıl sonra ilk kez İngilizceye çevrilir. Romanın İngilizce, Almanca, Fransızca, Rusça, Hırvatça, Arapça ve Arnavutça olmak üzere 7 dilde çevirisi olduğu gibi, daha bir çok dile çeviri aşamasında olduğu bilinenler arasında. Ünü uluslararası seviyeler ulaşan bu eşsiz eser, bugün bir çok neslin severek okuduğu ve hatta öğretmenlerin öğrencilerine tavsiye ettiği edebi eserler arasındaki yerini alıyor."),
          ),
        ],
      ),
    );
  }
}
