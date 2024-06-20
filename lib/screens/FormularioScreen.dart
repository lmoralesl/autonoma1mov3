import 'package:autonoma1/screens/RegistroScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Formulario());
}

class Formulario extends StatelessWidget {
  const Formulario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Formulario",
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
        title: const Text('Formulario'),
      ),
      body: Cuerpo(context),
      

    );
  }
}

Widget Cuerpo (context){
  return Container(
    padding: EdgeInsets.all(20),
    
   
    child: (
      Column(
        children: <Widget>[
          Text("Formulario de medicinas",style: TextStyle(color:Colors.indigo,fontSize: 20  ),),
          CampoId(context),
          CampoMedicina(context),
          CampoCategoria(context),
          CampoPrecio(context),
          BotonGuardar(context),
        ],
      )
    ),
  );
}

final TextEditingController _id = TextEditingController();
Widget CampoId(context){
  return(
    TextField(
      controller: _id,
      decoration: InputDecoration(
        hintText: "Ingesar ID"
      ),
    )
  );
}

final TextEditingController _medicina = TextEditingController();
Widget CampoMedicina(context){
  return(
    TextField(
      controller: _medicina,
      autocorrect: true,
      decoration: InputDecoration(
        hintText: "Ingesar Medicamento"
      ),
    )
  );
}

final TextEditingController _categoria = TextEditingController();
Widget CampoCategoria(context){
  return(
    TextField(
      controller: _categoria,
      decoration: InputDecoration(
        hintText: "Ingesar Categoria"
      ),
    )
  );
}

final TextEditingController _precio = TextEditingController();
Widget CampoPrecio(context){
  return(
    TextField(
      controller: _precio,
      decoration: InputDecoration(
        hintText: "Ingesar Precio"
      ),
    )
  );
}

Widget BotonGuardar (context){
  return(
    ElevatedButton(onPressed: (){
      guardar();

    }, child: Text("Guardar"),
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)),
    )
    
  );
}

Future<void> guardar() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("Medicinas/"+_id.text);

await ref.set({
  "id": _id.text,
  "medicina": _medicina.text,
  "categoria": _categoria.text,
  "precio": _precio.text
});

}