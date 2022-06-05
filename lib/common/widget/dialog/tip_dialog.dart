import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/dialog/base_dialog.dart';

class TipDialog extends BaseDialog{

  static show(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            elevation: 2.0,
            backgroundColor: Colors.white,
            insetAnimationDuration: const Duration(seconds: 2),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
            child: Container(
              width: getWidth(),
              height: 0.20.sh,
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(18.0))),
                      child: Text('温馨提示',style: TextStyle(color: Colors.black87,fontSize: 16.sp,fontWeight: FontWeight.bold),)
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text('您确定要退出账号？',style: TextStyle(color: Colors.black87,fontSize: 14.sp),),
                      ),
                    ),
                  ),
                  const Divider(height: .2,color: Colors.grey,thickness: .2),
                  Expanded(
                    flex: 9,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextButton(
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, double.maxFinite)),
                                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18)),
                                  )),
                                ),
                                onPressed: (){},
                                child: const Text('确定',style: TextStyle(fontSize: 14, color: Colors.blue))
                            )
                          ),
                          const VerticalDivider(width: .2,color: Colors.grey,thickness: .2),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, double.maxFinite)),
                                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(18)),
                                )),
                              ),
                            onPressed: (){},
                            child: const Text('取消', style: TextStyle(fontSize: 14, color: Colors.blue)),
                          ),)
                        ],
                      )
                    ),
                  ),
                ],
              )
            )
          );
        }
    );
  }
}