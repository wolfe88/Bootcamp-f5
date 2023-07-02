import 'package:explore_nearby/constants/routes.dart';
import 'package:explore_nearby/firebase/auth.dart';
import 'package:explore_nearby/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../theme.dart';
import '../utilities/helpers.dart';
import '../widgets/avatar.dart';
import 'package:sizer/sizer.dart';
import 'package:getwidget/getwidget.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final AuthRepository _currentUser = AuthRepository();
  String _userName = '';
  //String _bio = '';

  @override
  void initState() {
    super.initState();
    _loadCurrentUserName();
    //_loadCurrentUserBio();
  }

  Future<void> _loadCurrentUserName() async {
    String userName = await _currentUser.getCurrentUsersName();
    setState(() {
      _userName = userName;
    });
  }

  /*Future<void> _loadCurrentUserBio() async {
    String bio = await _currentUser.getCurrentUsersBio();
    setState(() {
      _bio = bio;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          icon:Icon(Icons.logout, color: Colors.red),
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
                            padding: const EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Text(
                                _userName,
                                style: const TextStyle(
                                    color: AppColors.textLigth,
                                    fontSize: 25,
                                    overflow: TextOverflow.ellipsis
                                ),
                                maxLines: 1,
                              ),
                            )
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
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
                       const Text(
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.textLigth,
                        ),
                        "Fusce scelerisque nunc non tincidunt porta. Quisque fringilla turpis vitae sapien dignissim, ut dapibus nisl egestas. Nunc aliquam gravida tellus, ut tempor dolor commodo suscipit. Morbi ac auctor leo, in aliquam ipsum. Maecenas sem arcu, vestibulum vel porttitor eu, auctor sit amet orci. Mauris feugiat dui eu augue porta, at pellentesque nulla dignissim. Proin semper libero ac lectus sollicitudin condimentum. Praesent at hendrerit neque. In viverra turpis vitae ante eleifend sollicitudin. Donec ut ullamcorper libero. Aliquam quis porta mauris, interdum maximus diam."
                        //_bio,
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
                              onPressed: () { },
                              child: const Text("Tümünü Görüntüle",
                                style: TextStyle(color: Colors.red),),),
                          ],
                        ),
                      ]
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
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
                ),

              ]
          ),
        ),
      ),
    );
  }
}