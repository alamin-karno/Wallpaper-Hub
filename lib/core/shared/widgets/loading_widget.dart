import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

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
