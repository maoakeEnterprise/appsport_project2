import 'package:appsport_project/provider/google_sign_in.dart';
import 'package:appsport_project/ui/page/homepage.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
class AuthentificationPage extends StatelessWidget {
  const AuthentificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasData){
            return HomePage();
          }
          else if(snapshot.hasError){
            return const Center(child: Text('ERREUR DE CHARGEMENT'),);
          }
          else {
            return Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                        child: Text('ICONE APPLICATION')
                    ),

                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 20),
                      width: 200,
                      child: Text('Hey toi, Connecte toi ',
                        style: CustomThemes.widgetName,)
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50)
                    ),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context, listen: false);
                      provider.googleLogin();
                    },
                    label: const Text('Inscription avec Google'),
                    icon: const FaIcon(
                        FontAwesomeIcons.google, color: Colors.red),
                  ),
                  const SizedBox(height: 50,),
                  const Center(child: Text('Déjà un compte ? Connectoi toi')),
                  const SizedBox(height: 200,)
                ],
              ),
            );
          }
        }
      ),
    );
  }
}
