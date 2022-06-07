import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}
double height = 150;
double weight = 63;
double bmi=28;
double age=18;
String results="Congrats! You are healthy";
class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("BMI Calculator",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0)),
                    color: Colors.orange,),
                  height: 150,
                  width: 400,

                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text("Height(in cms):${height.round()}",style: TextStyle(fontSize: 20.0)),
                        ),
                        Slider(
                          activeColor: Colors.black,
                          inactiveColor: Colors.grey,
                          thumbColor: Colors.black,
                          value: height,
                          max: 300,
                          min: 0,

                          onChanged: (double value) {
                            setState(() => height = value);
                            setState((){bmi=weight*10000/(height*height);});
                          },
                        )
                      ]
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0)),
                        color: Colors.orange,),
                      height: 150,
                      width: 400,

                      child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Text("Weight(in kgs):${weight}",
                                    style: TextStyle(fontSize: 20.0))
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {_increase();},


                                  child: const Text("+",style: TextStyle(fontSize: 20.0,color: Colors.black)),),
                                TextButton(onPressed: () {_decrease();},
                                    child: Text("_",style: TextStyle(fontSize: 20.0,color: Colors.black)))
                              ],
                            )
                          ]
                      )
                  ),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0)),
                        color: Colors.orange,),
                      height: 150,
                      width: 400,

                      child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Text("Age(in years):${age}",
                                    style: TextStyle(fontSize: 20.0))
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {_increaseage();},


                                  child: const Text("+",style: TextStyle(fontSize: 20.0,color: Colors.black)),),
                                TextButton(onPressed: () {_decreaseage();},
                                    child: Text("_",style: TextStyle(fontSize: 20.0,color: Colors.black)))
                              ],
                            )
                          ]
                      )
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0)),
                  color: Colors.orange,),
                width:400,
                height: 100,

                child:Column(
              children: [
              Padding(
              padding: const EdgeInsets.all(10.0),
      ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
            onPressed: () {
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const SecondRoute()),
      );
      },


              child: const Text("Calculate",style: TextStyle(fontSize: 20.0,color: Colors.black)),),
          ],
        )
        ]
    ),

              )

            ]
        ),
      ),
    );
  }
  void _increase(){
    setState((){weight=weight+1;});
    setState((){bmi=weight*10000/(height*height);});
    if(bmi<18.5){
      results="You are underweight, try eating healthier";
    }
    if(bmi>18.5){
      if(bmi>25){
        if(bmi>30){
          results="You are obese, try eating healthier";
        }
        else{
          results="You are overweight, try eating healthier";
        }
      }
      else{
        results="Congrats! You are healthy, keep it up";
      }
    }
  }
  void _decrease(){
    setState((){weight=weight-1;});
    setState((){bmi=weight*10000/(height*height);});
    if(bmi<18.5){
      results="You are underweight, try eating healthier";
    }
    if(bmi>18.5){
      if(bmi>25){
        if(bmi>30){
          results="You are obese, try eating healthier";
        }
        else{
          results="You are overweight, try eating healthier";
        }
      }
      else{
        results="Congrats! You are healthy, keep it up";
      }
    }
  }
  void _increaseage(){
    setState((){age=age+1;});
  }
  void _decreaseage(){
    setState((){age=age-1;});
    }
}



class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    appBar: AppBar(
        title: Text("BMI Results",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0)),
                    color: Colors.orange,),
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text("BMI : ${bmi.round()}\n\n\n${results}"
                              ,style: TextStyle(fontSize: 20.0)),
                        ),
                      ]
                  )
              )



        ]
        ),
      ),
    );
  }

}
