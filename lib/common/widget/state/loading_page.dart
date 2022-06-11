import 'package:flutter/material.dart';
import 'package:ibase_app/common/utils/utils.dart';

class LoadingPage extends StatelessWidget {

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
