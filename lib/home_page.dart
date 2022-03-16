import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'app_store.dart';
import 'detail_app.dart';

class HomePage extends StatefulWidget {
  final String username, pass;

  const HomePage({Key? key, required this.username, required this.pass}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: ListView.builder(

         itemCount: appList.length, itemBuilder: (context, index){
           final AppStore place = appList[index];
           return Card(
             child: InkWell(
               onTap: (){
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context){
                       return DetailApp(place: place);
                     }));
               },
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Expanded(
                     flex: 1,
                       child: Image.asset(place.imageLogo)),
                   Expanded(
                       flex: 2,
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Text(
                               place.name,
                               style: TextStyle(fontSize: 14),
                             ),
                             SizedBox(
                               height: 10,
                             ),
                             Text(place.developer),
                           ],
                         ),
                       ))
                 ],
               ),
             ),
           );

        }),
      ),
    );
  }
}



