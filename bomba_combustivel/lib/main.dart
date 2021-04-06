import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final valorEtanol = TextEditingController();
  final valorGasolina = TextEditingController();
  String resultante = "0.0";
  String etanol = "0.0";
  String gasosa = "0.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('SIMULAÇÃO DO COMBUSTIVEL')),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(32, 255, 50, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: valorEtanol,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'digite o valor',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'R\$ valor litro etanol',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: valorGasolina,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'digite o valor',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'R\$ valor litro gasolina',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            ButtonTheme(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    final double valorEtanolFinal =
                        double.parse((valorEtanol.text));
                    etanol = "$valorEtanolFinal";

                    final double valorGasolinaFinal =
                        double.parse((valorGasolina.text));
                    gasosa = "$valorGasolinaFinal";
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Valores(etanol, gasosa)),
                  );
                },
                child: Text('Converter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Valores extends StatelessWidget {
  final String etanolRecebe;
  final String gasosaRecebe;

  Valores(this.etanolRecebe, this.gasosaRecebe);

  String calculo(double gasolina, double alcool) {
    var valor = alcool / gasolina;
    if (valor > 0.7) {
      return "Gasolina é melhor";
    } else {
      return "Alcool é melhor";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VALORES"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(32, 255, 50, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Resultado: ${calculo(double.parse(gasosaRecebe), double.parse(etanolRecebe))}",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
