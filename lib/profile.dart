import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({
    required this.myNotifier,
    super.key,
  });

  final ValueNotifier<int> myNotifier;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return myProfile();
  }

  Widget myProfile() {
    return Center(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    // Image(image: image)
                    // TextButton(onPressed:() {

                    // }, child: Text("Change Profile Picture"),)
                    Icon(Icons.image, size: 100, color: Colors.deepPurple),
                    Text("Name Surname"),
                    Text("ID: 4"),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.phone),
                        Text("Phone"),
                        Spacer(),
                        Text("Phone Number"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Icon(Icons.mail),
                          Text("Email Adress"),
                          Spacer(),
                          Text("Email"),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.lock),
                        Text("Password"),
                        Spacer(),
                        Text("Change Password")
                      ],
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 10),
                    //   child: Row(
                    //     children: [
                    //       Icon(Icons.question_mark),
                    //       Text("Number"),
                    //       Spacer(),
                    //       ValueListenableBuilder(
                    //           valueListenable: widget.myNotifier,
                    //           builder: (context, count, child){
                    //             return Text("$count");
                    //           }),
                    //     ],
                    //   ),
                    // ),
                    ValueListenableBuilder(
                        valueListenable: widget.myNotifier,
                        builder: (context, count, child) {
                          if (count == 0) {
                            return Container();
                          }

                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Icon(Icons.question_mark),
                                Text("Count"),
                                Spacer(),
                                Text("$count"),
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  supportWidget(),
                  Column(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 30.0,
                      ),
                      Text('Log out'),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget supportWidget() {
    return GestureDetector(
      onTap: () async {
        // await launchUrl(Uri.parse("https://google.com"));
      },
      child: Column(
        children: [
          Icon(
            Icons.facebook_outlined,
            size: 30.0,
          ),
          Text('Support'),
        ],
      ),
    );
  }
}
