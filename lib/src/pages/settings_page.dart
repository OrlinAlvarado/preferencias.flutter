import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';
class SettingsPage extends StatefulWidget {

  static final String routeName = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;

  TextEditingController _textEditingController;

  final prefs = new PreferenciasUsuario();
   
  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _textEditingController = new TextEditingController( text: prefs.nombreUsuario);
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

  }

  _setSelectedRadio(int valor ) {
    prefs.genero = valor;
    _genero = valor;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidet(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle( fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: ( value ){
              _colorSecundario = value;
              prefs.colorSecundario = value;
              setState(() {
                
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenio'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric( horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono',
              ),
              onChanged: (value) {
                prefs.nombreUsuario =  value;
              },
            ),
          )
        ],
      )
    );
  }


}