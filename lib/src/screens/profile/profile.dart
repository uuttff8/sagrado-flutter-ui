import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: PlatformScaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ProfileAppBar(),
              Padding(
                padding:
                    const EdgeInsets.only(right: 16.0, top: 30.0, left: 16),
                child: BonusesWidget(),
              ),
              HistoryButton(),
              Divider(height: 0),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'События',
                          style: TextStyle(fontFamily: 'Circe', fontSize: 17),
                        ),
                        Container(
                          height: 2,
                          width: 45,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 17),
                    Container(
                      height: 150,
                      child: GridView.count(
                        // Create a grid with 2 columns. If you change the scrollDirection to
                        // horizontal, this produces 2 rows.
                        crossAxisCount: 1,
                        scrollDirection: Axis.horizontal,
                        // Generate 100 widgets that display their index in the List.
                        children: List.generate(100, (index) {
                          return Center(
                            child: Text(
                              'Item $index',
                              style: Theme.of(context).textTheme.headline,
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryButton extends StatelessWidget {
  const HistoryButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: CupertinoButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'История',
              style: TextStyle(
                fontFamily: 'Circe',
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 7),
            Image.asset('assets/images/small-arrow.png', width: 5, height: 10),
          ],
        ),
        onPressed: () {
          print('history button pressed');
        },
      ),
    );
  }
}

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.asset(
                'assets/images/sagrado-logo.png',
                width: 34,
                height: 44,
              ),
              SizedBox(width: 15),
              Text(
                'Олег'.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Circe',
                ),
              ),
            ],
          ),
          PlatformButton(
            padding: EdgeInsets.zero,
            child: Icon(Icons.settings),
            onPressed: () {
              print('settings button pressed');
            },
          ),
        ],
      ),
    );
  }
}

class BonusesWidget extends StatelessWidget {
  const BonusesWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 78,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350],
              spreadRadius: 3.0,
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'БОНУСЫ',
                  style: TextStyle(fontFamily: 'Circe', fontSize: 9),
                ),
                Text('5000' + ' ₽',
                    style: TextStyle(
                        fontFamily: 'Circe',
                        fontSize: 25,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          PlatformButton(
            child:
                Image.asset('assets/images/arrow.png', width: 34, height: 34),
            onPressed: () {
              print('arrow button pressed');
            },
          )
        ],
      ),
    );
  }
}
