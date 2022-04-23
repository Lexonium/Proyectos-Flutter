import 'package:flutter/material.dart';
import 'package:qr_reader_clase/models/usuario_model.dart';
import 'package:qr_reader_clase/providers/usuario_provider.dart';

class LoginPage extends StatefulWidget {
  //const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UsuarioModel usuario = new UsuarioModel();
  final formKey = GlobalKey<FormState>();
  UsuarioProvider _usuarioProvider = new UsuarioProvider();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _mostrarImagenLogo(),
                _meterCorreo(),
                _meterPass(),
                Center(
                  child: Row(
                    children: [
                      _botonValidar(context),
                      _botonRegistrar(context)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _mostrarImagenLogo() {
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      image: NetworkImage(
        'https://cdn.logo.com/hotlink-ok/logo-social.png',
      ),
      height: 150,
      fit: BoxFit.cover,
    );
  }

  Widget _meterCorreo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Correo'),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => usuario.email = value,
    );
  }

  Widget _meterPass() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Contrasenia'),
      obscureText: true,
      onSaved: (value) => usuario.password = value,
    );
  }

  Widget _botonValidar(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: () => Navigator.pushNamed(context, 'home'),
      icon: Icon(Icons.save),
      label: Text('Ingresar'),
    );
  }

  Widget _botonRegistrar(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: () => Navigator.pushNamed(context, 'home'),
      icon: Icon(Icons.save),
      label: Text('Registrar'),
    );
  }

  _verificarUsuario(BuildContext context) async {
    bool validar = await _usuarioProvider.loginUsuario(usuario);
    if (validar == true) {
      Navigator.pushNamed(context, 'home');
    }
  }

  _registrarUsuario(BuildContext context) async {
    bool validar = await _usuarioProvider.registrarUsuario(usuario);
    if (validar == true) {
      Navigator.pushNamed(context, 'home');
    }
  }
}
