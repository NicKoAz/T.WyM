import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                _buildInputField("Email", Icons.email, emailController),
                SizedBox(height: 10),
                _buildInputField("Contraseña", Icons.lock, passwordController, isPassword: true),
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                    Text("Recuerda mis datos"),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (validateInputs()) {
                      // Lógica de inicio de sesión
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  child: Text("Iniciar Sesión"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white, // Color del texto
                  ),
                  child: Text("¿Olvidaste tu contraseña?"),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => _launchURL("https://www.facebook.com/"),
                      child: Image.asset(
                        'assets/facebook.png',  // Coloca la ruta correcta de tu imagen de Facebook
                        width: 40,
                        height: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () => _launchURL("https://translate.google.com/"),
                      child: Image.asset(
                        'assets/translate.png',  // Coloca la ruta correcta de tu imagen de Google Translate
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(icon, color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }

  bool validateInputs() {
    return emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperar Contraseña"),
      ),
      backgroundColor: Colors.blue, // Puedes cambiar este color según tus preferencias
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildInputField("Correo Electrónico", Icons.email, emailController),
            SizedBox(height: 10),
            _buildInputField("Contraseña Nueva", Icons.lock, newPasswordController, isPassword: true),
            SizedBox(height: 10),
            _buildInputField("Confirmar Contraseña", Icons.lock, confirmNewPasswordController, isPassword: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para procesar la recuperación de contraseña
              },
              child: Text("Recuperar Contraseña"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(icon, color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
