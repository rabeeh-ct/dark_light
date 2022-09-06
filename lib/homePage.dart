import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color cls=Colors.white;
  String? temp ='';
  @override

  theme() async{
    SharedPreferences sh=await SharedPreferences.getInstance();
    temp=sh.getString('color');
    print(temp);
    cls=Color(int.parse(temp!));




    // 0xff000000 white
    // Color(0xffffffff) white
  }
  theme2(clor) async{
    SharedPreferences sh= await SharedPreferences.getInstance();
    sh.setString('color', '$clor');
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    theme();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: cls,
      appBar: AppBar(title: Text('Home Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ElevatedButton(onPressed: () {
            setState(() {
              cls=Color(0xffffffff);
              print('kdj$cls');
            });
            theme2('0xffffffff');
            print(cls);
          }, child: Text('Light Theme')),
          ElevatedButton(onPressed: () {
            setState(() {
              cls=Color(0xff000000);

            });
            theme2('0xff000000');


          }, child: Text('Dark Theme'))],
        ),
      ),
    );
  }
}
