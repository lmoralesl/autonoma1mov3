import 'package:autonoma1/screens/LoginScreen.dart';
import 'package:autonoma1/screens/RegistroScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Welcome());
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body:
     
      Cuerpo(context)
    );  
  }
}

Widget Cuerpo (context){
  return(
    Column(
      children: <Widget>[
        Text("WELCOME"),
        BotonLogin(context),
        BotonRegistro(context),
        BotonFormulario(),
      ],
    )
  );
}

Widget BotonLogin(context){
  return(
    FilledButton(
      onPressed: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: 
        (context)=> Login()
        )
        );
      },
     child: Text("ir a Login"))
  );
}

Widget BotonRegistro(context){
  return(
    ElevatedButton(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.amber[300])),
      onPressed: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: 
        (context)=> Registro()
        )
        );
      },
     child: Text("ir a Registro"))
  );
}

Widget BotonFormulario(){
  return(
    ElevatedButton(onPressed: (){},
     child: Text("ir a Formulrio"))
  );
}




