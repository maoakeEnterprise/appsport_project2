
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';

class CaseWidgetExoProg extends StatelessWidget {
  const CaseWidgetExoProg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.redAccent.withAlpha(30),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(margin: const EdgeInsets.only(top: 40),child: Text("Nom Exo",style: CustomThemes.widgetName,)),
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13)
                    ),
                    child: Text("57 KG",style: CustomThemes.descriptifTitle,textAlign: TextAlign.center,),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: 120,
                    height: 40,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13)
                    ),
                    child: Text("10 Rep",style: CustomThemes.descriptifTitle,textAlign: TextAlign.center),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(image: AssetImage("assets/images/biceps.png"),width: 100,height: 100,),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 60,
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Image(image: AssetImage("assets/images/stylo.png"),),
                ),
                onTap: (){
                  Navigator.pushNamed(context, "exoprogramme");
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
