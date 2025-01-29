import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextspot_adminpanel/utils/constants/text_strings.dart';
import 'package:nextspot_adminpanel/utils/theme/theme.dart';

/// -- Use this Class to setup themes, initial bindings, any animations and so on.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      routes: {
        '/': (context) => const FirstScreen(),
        '/second-screen': (context) => const SecondScreen(),
      },

      getPages: [
        GetPage(name: '/', page: () => const FirstScreen()),
        GetPage(name: '/second-screen/', page: () => const SecondScreen()),
        GetPage(name: '/second-screen/:userId', page: () => const SecondScreen()),
      ],
      //home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Simple Navigation Default Flutter Navigator Vs GetX Navigator",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SecondScreen(),
                        )
                      );
                    },
                    child: const Text('Default Navigation'),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () => Get.to (const SecondScreen()),
                    child: const Text('GetX Navigation'),
                ),
              ),
        
              /// NAMED NAVIGATION
              const SizedBox(height: 50),
              const Divider(),
              const Text(
                'Named Navigation: Flutter Navigator Vs GetX Named Navigation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed("/second-screen");
                    },
                    child: const Text('Default Named Navigation'),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                    onPressed: (){
                      Get.toNamed('/second-screen');
                    },
                    child: const Text('GetX Named Navigation')
                ),
              ),
              const SizedBox(height: 50,),
        
              const Divider(),
        
              ///PASS DATA
              const Text(
                "Pass Data Between Screen - GetX",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                    onPressed: (){
                      Get.toNamed('/second-screen', arguments: 'GetX is fun with CwT ');
                    },
                    child: const Text("GetX Pass Data"),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: (){
                    Get.toNamed('/second-screen/1234');
                  },
                  child: const Text("GetX Pass Data"),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: (){
                      Get.toNamed("/second-screen?device=phone&id=354&name=Stefan");
                    },
                    child: const Text('Pass Data in URL'),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: (){
                    Get.toNamed("/second-screen?device=phone&id=354&name=Stefan", arguments: 'GetX is fun with CwT');
                  },
                  child: const Text('Pass Data in URL with argument'),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: (){
                    Get.toNamed("/second-screen?device=phone&id=354&name=Stefan", arguments: 'GetX is fun with CwT');
                  },
                  child: const Text('Pass Data in URL with argument'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Get.arguments ?? ''),
            Text('Device = ${Get.parameters['device'] ?? ''}'),
            Text('ID = ${Get.parameters['id'] ?? ''}'),
            Text('Name = ${Get.parameters['name'] ?? ''}'),
            Text('Name = ${Get.parameters['userId'] ?? ''}'),
          ],
        ),
      ),
    );
  }
}


