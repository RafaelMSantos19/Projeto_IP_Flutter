import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculador de IP',
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Classificador de redes'),
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
  final valor = TextEditingController();
  int ip = 0  ;

  void calcula(ip){
    return ip;
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Column(
            children:<Widget>[
              Padding(padding:EdgeInsets.symmetric(horizontal: 50, vertical: 20),

              child: TextField(
                      controller: valor,
                      decoration: InputDecoration(
                                  hintText: 'Digite o IP', ),
                      ),
                      
              ),
              Padding(padding:EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              
              child: TextButton(
                  
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                    
                  ),
                  onPressed: () { 
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(content: Text('Resposta: ' + valor.text));
                        }
                      );
                   },
                  child: Text('Calcular a Classe'),
              ),
              
              ),
              Padding(padding:EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Text('O IP pertence a Classe: '+'$ip'),
              ),
            ],
      ),
      
    );
  }
}
