import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ibase_app/common/widget/state/state.dart';

abstract class BaseGetView<T> extends GetView<T>{
  const BaseGetView({Key? key}) : super(key: key);





  Widget loadingPage(){
    return const LoadingPage();
  }

  Widget emptyPage(){
    return const EmptyPage();
  }

  Widget errorPage() {
    return const ErrorPage();
  }

}