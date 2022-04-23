import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  //InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _correo = "";
  String _fecha = "";
  String _opcionSeleccionada = "Otro";
  List<String> _generos = ['Masculino', 'Femenino', 'Otro'];
  TextEditingController _inputFieldDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _mostrarPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          counter: Text('Caracteres ${_nombre.length}'),
          hintText: 'Nombre Completo',
          labelText: 'Nombre',
          helperText: 'Introducir su nombre',
          icon: Icon(Icons.accessibility),
          suffixIcon: Icon(Icons.circle),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'email',
          labelText: 'Email',
          icon: Icon(Icons.email),
          suffixIcon: Icon(Icons.alternate_email),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      onChanged: (valor) {
        setState(() {
          _correo = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'password',
          labelText: 'Password',
          icon: Icon(Icons.security),
          suffixIcon: Icon(Icons.security_sharp),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      onChanged: (valor) {
        setState(() {});
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          hintText: 'Fecha nacimiento',
          labelText: 'Fecha Nacimiento',
          icon: Icon(Icons.date_range),
          suffixIcon: Icon(Icons.calendar_today_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1980),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      _fecha = picked.toString();
      _inputFieldDateController.text = _fecha;
    }
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 25.0,
        ),
        Expanded(
          child: DropdownButton(
              items: _getOpcionesGenero(),
              value: _opcionSeleccionada,
              isExpanded: true,
              onChanged: (opt) {
                setState(() {
                  _opcionSeleccionada = opt;
                });
              }),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> _getOpcionesGenero() {
    //USAR MAP function here
    return _generos.map((opt) {
      return DropdownMenuItem(
        child: Text(opt),
        value: opt,
      );
    }).toList();
  }

  Widget _mostrarPersona() {
    return ListTile(
      title: Text("Hola " + _nombre),
      subtitle: Text("Correo: $_correo"),
    );
  }
}
