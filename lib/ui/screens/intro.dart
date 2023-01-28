import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _IntroScreen();
  }
}

class _IntroScreen extends StatefulWidget {
  const _IntroScreen();

  @override
  State<StatefulWidget> createState() {
    return _IntroState();
  }
}

class _IntroState extends State<_IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(45, 50, 45, 70),
              child: Image.asset("assets/images/sipinggang.png", height: 192, width: 300,),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text( 
                "Selamat Datang",
                style: TextStyle(
                  color: Color(0xFF2778BD),
                  fontSize: 32
                ),
              ),
            ),
            Text( 
              "Deteksi penyakit pinggangmu\nsekarang juga",
              style: TextStyle(
                color: Color(0xFF2C2929),
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 120),
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0), 
                    backgroundColor: Color(0xFF2778BD),
                  ),
                  child: Text(
                      "Mulai",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}