import 'package:flutter/material.dart';
import 'package:helloworld/pages/barra_inferior.dart';

class ConfigurarPerfil extends StatefulWidget {
  const ConfigurarPerfil({Key? key}) : super(key: key);

  @override
  State<ConfigurarPerfil> createState() => _ConfigurarPerfilState();
}

class _ConfigurarPerfilState extends State<ConfigurarPerfil> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFABEB3),
        title: Text(
          'Configurar perfil',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 150.0,
                ),
                const Text(
                  'Alterar foto do perfil',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 30),
                Row(children: [
                  const Text(
                    'Alterar e-mail',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )
                ]),
                SizedBox(height: 8),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    }

                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: Color(0xFFFFECE8),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                Row(children: [
                  const Text(
                    'Alterar nome',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )
                ]),
                SizedBox(height: 8),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    }

                    return null;
                  },
                  controller: nomeController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: Color(0xFFFFECE8),
                  ),
                ),
                const SizedBox(height: 16),
                Row(children: [
                  const Text(
                    'Alterar senha',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )
                ]),
                SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    } else if (value.length < 6) {
                      return 'A senha precisa ter no mínimo 6 digitos';
                    }

                    return null;
                  },
                  controller: senhaController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: Color(0xFFFFECE8),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(primary: Color(0xFFFABEB3)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: const Text(
                      'Salvar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  void onPressed() {
    String emailDigitado = emailController.text;
    String nomeDigitado = nomeController.text;
    String senhaDigitada = senhaController.text;

    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const BarraInferior();
      }));
    }
  }
}
