import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
      child: SpinKitSpinningLines(
        color: Colors.black54,
        size: 80.0,
      ),
    );
  }
}
