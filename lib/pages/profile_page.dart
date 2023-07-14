<<<<<<< HEAD
import 'package:explore_nearby/constants/routes.dart';
import 'package:explore_nearby/firebase/auth.dart';
import 'package:explore_nearby/pages/favori_page.dart';
import 'package:explore_nearby/screens/login_screen.dart';
=======
import 'package:explore_nearby/firebase/auth.dart';
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48
import 'package:flutter/material.dart';
import '../firebase/firestoreDB.dart';
import 'package:explore_nearby/yeni/mekan_genel.dart';
import '../screens/home_screen.dart';
import '../theme.dart';
import '../utilities/helpers.dart';
import '../widgets/avatar.dart';
import 'package:explore_nearby/widgets/fav_place_card.dart';
import 'package:sizer/sizer.dart';
import 'package:getwidget/getwidget.dart';

<<<<<<< HEAD
=======
import '../screens/home_screen.dart';
import '../theme.dart';
import '../utilities/helpers.dart';
import '../widgets/avatar.dart';

>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48

class ProfilePage extends StatefulWidget {
  const ProfilePage();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final AuthRepository _currentUser = AuthRepository();
  String _userName = '';
<<<<<<< HEAD
  String _userSurname = '';
  String _bio = '';

  firestoreDB fireDB = firestoreDB();
=======
  //String _bio = '';
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48

  @override
  void initState() {
    super.initState();
    _loadCurrentUserName();
<<<<<<< HEAD
    _loadCurrentUserBio();
    _loadCurrentUserSurname();
=======
    //_loadCurrentUserBio();
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48
  }

  Future<void> _loadCurrentUserName() async {
    String userName = await _currentUser.getCurrentUsersName();
    setState(() {
      _userName = userName;
    });
  }
<<<<<<< HEAD
  Future<void> _loadCurrentUserSurname() async {
    String userSurname = await _currentUser.getCurrentUsersSurname();
    setState(() {
      _userSurname = userSurname;
    });
  }

  Future<void> _loadCurrentUserBio() async {
=======

  /*Future<void> _loadCurrentUserBio() async {
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48
    String bio = await _currentUser.getCurrentUsersBio();
    setState(() {
      _bio = bio;
    });
<<<<<<< HEAD
  }
=======
  }*/

>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          icon:const Icon(Icons.logout, color: Colors.red),
          onPressed: (){
            _currentUser.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const Login()),
            );
          },
        ),
      ),
=======
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 10),
                      child: Column(
                        children: [
                          IconButton (
                            icon: Avatar(radius: 100.0, url: Helpers.randomPictureUrl()),
                            onPressed: () {  },
                            iconSize: 130.0,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
<<<<<<< HEAD
                          width: 200,
                            padding: const EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Text(
                                "$_userName $_userSurname",
                                style: const TextStyle(
                                    color: AppColors.textLigth,
                                    fontSize: 25,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
=======
                            padding: const EdgeInsets.all(20),
                            child: Expanded(
                              child: Text(
                                _userName,
                                style: const TextStyle(
                                    color: AppColors.textLigth,
                                    fontSize: 25,
                                    overflow: TextOverflow.ellipsis
                                ),
                                maxLines: 1,
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48
                              ),
                            )
                        ),
                        Container(
<<<<<<< HEAD
=======
                          padding: const EdgeInsets.all(20),
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48
                          child:
                          FloatingActionButton.extended(
                            backgroundColor: AppColors.iconDark,
                            highlightElevation: 15,
                            icon: const  Icon(Icons.edit),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeScreen(),),);
                            },
                            label: const Text(
                              "Profili Düzenle",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(8),
                      child:
<<<<<<< HEAD
                      Text(
                        style: const TextStyle(
                          fontSize: 17,
                          color: AppColors.textLigth,
                        ),
                        //"Fusce scelerisque nunc non tincidunt porta. Quisque fringilla turpis vitae sapien dignissim, ut dapibus nisl egestas. Nunc aliquam gravida tellus, ut tempor dolor commodo suscipit. Morbi ac auctor leo, in aliquam ipsum. Maecenas sem arcu, vestibulum vel porttitor eu, auctor sit amet orci. Mauris feugiat dui eu augue porta, at pellentesque nulla dignissim. Proin semper libero ac lectus sollicitudin condimentum. Praesent at hendrerit neque. In viverra turpis vitae ante eleifend sollicitudin. Donec ut ullamcorper libero. Aliquam quis porta mauris, interdum maximus diam."
                        _bio,
=======
                       const Text(
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.textLigth,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        "Fusce scelerisque nunc non tincidunt porta. Quisque fringilla turpis vitae sapien dignissim, ut dapibus nisl egestas. Nunc aliquam gravida tellus, ut tempor dolor commodo suscipit. Morbi ac auctor leo, in aliquam ipsum. Maecenas sem arcu, vestibulum vel porttitor eu, auctor sit amet orci. Mauris feugiat dui eu augue porta, at pellentesque nulla dignissim. Proin semper libero ac lectus sollicitudin condimentum. Praesent at hendrerit neque. In viverra turpis vitae ante eleifend sollicitudin. Donec ut ullamcorper libero. Aliquam quis porta mauris, interdum maximus diam."
                        //_bio,
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                Text(
                                  " Favori Mekanlar",
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: AppColors.textLigth,
                                  ),
                                ),
                              ],
                            )
                          ],),
                        Column(
                          children: [
                            TextButton(
<<<<<<< HEAD
                              child: const Text("Tümünü Görüntüle",
                                style: TextStyle(color: Colors.red),),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const FavoriPage(),),);
                              },
                            ),
=======
                              onPressed: () { },
                              child: const Text("Tümünü Görüntüle",
                                style: TextStyle(color: Colors.red),),),
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48
                          ],
                        ),
                      ]
                  ),
                ),
<<<<<<< HEAD

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                    children:
                      mekanListesi
                          .map((denememekan) => FavoritePlaceCard(place: denememekan))
                          .toList(),
                   ),),),

                /*Container(
=======
                Container(
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48
                  margin: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                            children: [
                              IconButton(
                                icon: Image.asset("assets/images/anıtkabir.jpg"),
<<<<<<< HEAD
                                onPressed: () async {
                                 await fireDB.getPlaceFromID("bfMtis1g7XQz4V5Tss0H").then((value) => print(value?.name));
                                },
=======
                                onPressed: () { },
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48
                                iconSize: 120,
                              ),
                              const Text(
                                "Anıtkabir",
                                style: TextStyle(
                                    fontSize: 20),
                              ),
                            ]
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: Image.asset("assets/images/Ephesus_Celsus_Library_Façade.jpg"),
                              onPressed: () { },
                              iconSize: 120,
                            ),
                            const Text(
                              "Efes Antik Kenti",
                              style: TextStyle(
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: Image.asset("assets/images/anıtkabir.jpg"),
                              onPressed: () { },
                              iconSize: 120,
                            ),
                            const Text(
                              "Anıtkabir",
                              style: TextStyle(
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: Image.asset("assets/images/anıtkabir.jpg"),
                              onPressed: () { },
                              iconSize: 120,
                            ),
                            const Text(
                              "Anıtkabir",
                              style: TextStyle(
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
<<<<<<< HEAD
                ),*/
=======
                ),
>>>>>>> 2aa5de60e4525e02bcd6bea9e8302ad89490be48
              ]
          ),
        ),
      ),
    );
  }
}