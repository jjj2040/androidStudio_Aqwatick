import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled111/01_Operator_PL1/01OperButtle/operatorButtle.dart';
import 'bottomnavbar.dart';
import 'styleBoxDecoration.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Named Routes Demo',
    ),
  );
}

// first display
class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: const Text('First Screen'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          //color: Colors.lightBlue,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  //'https://foni.club/uploads/posts/2022-12/thumbs/1672492899_foni-club-p-kartinki-na-telefon-more-vertikalnie-32.jpg'),
                  'https://i.pinimg.com/236x/46/72/b2/4672b272e8cf10aece1739a67e0c60a8--beach-rocks-seychelles.jpg'),
              //'https://i.pinimg.com/236x/4a/68/85/4a688599095faf37fb33fcdc5e7c40e7.jpg'),

              fit: BoxFit.cover,
            ),

            //decoration: BoxDecoration(
            // color: Colors.blue
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //first input text
              Container(
                margin: const EdgeInsets.only(
                    left: 40.0, right: 40.0, top: 40.0, bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  gradient: const LinearGradient(colors: [
                    Colors.lightBlueAccent,
                    Colors.lightGreenAccent,
                    Colors.lightBlueAccent,
                  ]),
                ),
                child: const TextField(
                  decoration: InputDecoration(hintText: "Ваше имя"),
                  textAlign: TextAlign.center,
                ),
              ),

              //second input text
              Container(
                margin: const EdgeInsets.only(
                    left: 40.0, right: 40.0, top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  gradient: const LinearGradient(colors: [
                    Colors.lightBlueAccent,
                    Colors.lightGreenAccent,
                    Colors.lightBlueAccent,
                  ]),
                ),
                child: const TextField(
                  decoration: InputDecoration(hintText: "Пароль"),
                  textAlign: TextAlign.center,
                ),
              ),

              // button
              Container(
                margin: const EdgeInsets.only(
                    left: 40.0, right: 40.0, top: 30.0, bottom: 10.0),
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const BottomNavBar()));
                  },
                     style: styleButtonInputPassword1,
                      child: const Text('ВХОД'),
                )),
              ),

              //---------------- временный вход для операторов
              Container(
                margin: const EdgeInsets.only(
                    left: 40.0, right: 40.0, top: 30.0, bottom: 10.0),
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar())
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const OperatorButtle()));
                  },
                      style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.cyanAccent),
                    overlayColor: MaterialStateProperty.all(Colors.green),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 15),
                      //primary: Colors.redAccent,
                      //backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyanAccent),
                      //padding: MaterialStateProperty.all(EdgeInsets.all(20.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                    ),
                  ),
                           child: const Text('Временный вход для операторов'),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// second display
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(
        // title: const Text('Second Screen'),
        //),
        body: Center(
            child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/third');
      },
      child: const Text('ВХОД'),
    )));
  }
}

//--------------------------

/*

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
          child: Text('Favorite Page',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          )),
    );
  }
}
*/

/*
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      body: Center(
          child: Text('Cart Page',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),)),
    );
  }
}
 */

/*

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
          child: Text('Profile Page',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),)),
    );  }
}

 */
