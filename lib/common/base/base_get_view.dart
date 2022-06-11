import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ibase_app/common/widget/state/state.dart';

abstract class BaseGetView<T> extends GetView<T>{
  const BaseGetView({Key? key}) : super(key: key);


  Widget buildLoading(){
    return const LoadingPage();
  }

  Widget buildEmpty(){
    return const EmptyPage();
  }

  Widget buildError(VoidCallback onRetry) {
    return ErrorPage(onRetry: onRetry);
  }
}