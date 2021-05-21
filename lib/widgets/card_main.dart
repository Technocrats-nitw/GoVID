/*
Coder : Ashiqa Rahman
Team :technocrats
National Institute of Technology Warangal
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technocrats/screens/acc_ui/healthreport.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/widgets/custom_clipper.dart';

class CardMain extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String value;
  final String unit;
  final Color color;

  CardMain({Key key, this.image, this.title, this.value, this.unit, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        width: ((MediaQuery.of(context).size.width -
                (Constants.paddingSide * 2 + Constants.paddingSide / 2)) /
            2),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: color,
        ),
        child: Material(
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                Positioned(
                  child: ClipPath(
                    clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.black.withOpacity(0.03),
                      ),
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Icon and Hearbeat
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(width: 20, height: 20, image: image),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 13, color: Constants.textDark),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Constants.textDark,
                        ),
                      ),
                      Text(
                        unit,
                        style:
                            TextStyle(fontSize: 15, color: Constants.textDark),
                      ),
                    ],
                  ),
                )
              ],
            ),
            onTap: () {
              debugPrint("CARD main clicked. redirect to details page");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen()),
              );
            },
          ),
          color: Colors.transparent,
        ),
      ),
    );
  }
}
