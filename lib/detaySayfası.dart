import 'package:flutter/material.dart';
import 'package:proje_filmler_uygulamasi/filmler.dart';

class DetaySayfasi extends StatefulWidget {

Filmler film;
DetaySayfasi({required this.film});

  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_adi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(widget.film.resim_adi),
            Text("${widget.film.fiyat} \u{20BA}",style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Satın Al",style: TextStyle(fontSize: 18),),
                onPressed: (){
                  print("${widget.film.film_adi} Satın alındı");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
