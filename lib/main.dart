
import 'package:flutter/material.dart';

import 'package:flutter_locales/flutter_locales.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medical_app/router/app_router.dart';

import 'core/di/injection.dart';

import 'features/contact_us/presentation/screens/contact_us_screen.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Locales.init(['en', 'ar']);
   await init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  LocaleBuilder(
        builder : (locale) =>
         ScreenUtilInit(
           designSize: const Size(360, 690),
           minTextAdapt: true,
           splitScreenMode: true,
           builder: (_,child) {
             return MaterialApp(
                 debugShowCheckedModeBanner: false,
                 localizationsDelegates: Locales.delegates,
                 supportedLocales: Locales.supportedLocales,
                 locale: locale,
                 onGenerateRoute: AppRouter.onGenerateRoute,
                 home: Builder(
                   builder: (context) {
                     return ContactUsScreen() ;
                   },
                 )
             ) ;
           },
         )

    );
  }
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
                context.localeString('message')
            ),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return HomePage();
                }));
              }, child: Text("Go To Next Page"))
        ],
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List locales = [
    "English",
    "العربی"
  ];

  //Language code use to change language based on code
  List localeCodes = [
    "en",
    "ar"
  ];

  int currentIndex = 0;

  bool selectedLocale = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   //Now if we want our text widget get translated we should replace Text widget with LocaleText
      //   title: Text(context.localeString('title')),
      // ),

      //Now we are going to create language to switch between

      body: Center(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: locales.length,
            itemBuilder: (context,index){
              //If currentIndex equal index of builder the the bool value gets true
              selectedLocale = currentIndex == index;
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: ListTile(
                  onTap: (){
                    // in here we make a click on each language to switch between based on its index
                    setState(() {
                      // Sorry my mistake
                      currentIndex = index;
                    });
                    Locales.change(context, localeCodes[currentIndex]);
                  },
                  //So now we want the leading icon to change after selected language
                  leading: Icon(selectedLocale? Icons.check : Icons.language,color: Colors.white,),
                  title: Text(locales[index],style: const TextStyle(color: Colors.white),),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.white,),
                ),
              );
            }),
      ),
    );
  }
}