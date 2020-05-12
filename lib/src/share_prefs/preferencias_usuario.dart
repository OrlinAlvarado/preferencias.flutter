import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static final PreferenciasUsuario _istancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _istancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  //Nincuga de estas propiedades se usa
  // bool   _colorSecundario;
  // int    _genero;
  // String _nombre;

  intPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  //GET y SET de Genero
  get genero{
    return _prefs.getInt('genero') ?? 1;
  }

  set genero (int value){
    _prefs.setInt('genero', value);
  }

 //GET y SET de ColorSecundario
  get colorSecundario{
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario (bool value){
    _prefs.setBool('colorSecundario', value);
  }
 
 //GET y SET de Nombre
  get nombreUsuario{
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario (String value){
    _prefs.setString('nombreUsuario', value);
  }
 
 //GET y SET de UltimaPagina
  get ultimaPagina{
    return _prefs.getString('ultimaPagina') ?? '/home';
  }

  set ultimaPagina (String value){
    _prefs.setString('ultimaPagina', value);
  }


}
