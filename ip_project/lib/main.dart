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
  
  
  final _formclasse = GlobalKey<FormState>();

  double ip = 0.0;
  
  var divide;
  var _valor = ' '; 

  void _calcula(){
    setState(() {
      if(ip >= 0 && ip <=126){
       _valor = ' A';
    }
    if(ip >= 128 && ip <=191){
       _valor = ' B';
    }
    if(ip >= 192 && ip <=223){
       _valor = ' C';
    }
    if(ip >= 224 && ip <=239){
       _valor = ' D';
    }
    if(ip >= 240 && ip <=255){
       _valor = ' E';
    }
    if(ip == 127){
      _valor =' LocalHost';
    }
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Form(
        key: _formclasse,
        child: Column(
          
            children:<Widget>[
              Padding(padding:EdgeInsets.symmetric(horizontal: 50, vertical: 20),

              child:
              TextFormField(
                      decoration: const InputDecoration( hintText: 'Digite o IP'),
                      validator: (value) {
                                  if (value == null || value.isEmpty) {
                                  return 'Digite um valor!!';
                                  }else{
                                    divide= value.split('.');
                                    ip = double.parse(divide[0]);
                                  }
                                  return null;
                            },
                      ),
              ),
              Padding(padding:EdgeInsets.symmetric(horizontal: 50, vertical: 20),

              child:
             ElevatedButton(
                  
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                    
                  ),
                  onPressed: () { 
                        if (_formclasse.currentState!.validate()) {
                            _calcula();
                        }
                    },
                  child: Text('Calcular a Classe'),
              ),
              ),
              Padding(padding:EdgeInsets.symmetric(horizontal: 50, vertical: 20),

              child:
              //Text('Valor do IP e: $ip'),
             Text('O IP pertence a Classe: $_valor ', 
                              style: TextStyle(fontSize:20.0)),
              ),
              
            ],
        ),
      ),
      
    );
  }
}
