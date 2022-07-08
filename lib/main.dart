import 'package:flutter/material.dart';
import 'package:proje_filmler_uygulamasi/detaySayfas%C4%B1.dart';
import 'package:proje_filmler_uygulamasi/filmler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Filmler '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Filmler>> FilmleriGetir() async{
    var filmlerListesi=<Filmler>[];

    var f1=Filmler(1, "Anadoluda", "images/anadoluda.png", 15.99);
    var f2=Filmler(1, "Django", "images/django.png", 25.99);
    var f3=Filmler(1, "İnception", "images/inception.png", 45.99);
    var f4=Filmler(1, "İnterstellar", "images/interstellar.png", 65.99);
    var f5=Filmler(1, "The Hateful Eight", "images/thehatefuleight.png", 5.99);
    var f6=Filmler(1, "The Pianist", "images/thepianist.png", 25.99);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);

    return filmlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: FilmleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var filmlerListesi=snapshot.data;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5,
              ),
              itemCount: filmlerListesi!.length,
              itemBuilder: (context,indeks){
                var film=filmlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfasi(film: film,)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(film.resim_adi),
                        Text(film.film_adi,style:TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${film.fiyat} \u{20BA}",style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
