import 'package:get/get.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/dialog/base_dialog.dart';

class TipDialog extends BaseDialog{


  static void show(VoidCallback onConfirm,{String? title,String? content,String? confirm, String? cancel,VoidCallback? onCancel}) {
    if (Get.isDialogOpen == true) {
      return;
    }
    Get.dialog(
      _buildDialog(onConfirm,title: title,content: content,confirm: confirm,cancel: cancel,onCancel: onCancel),
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.6),
      barrierDismissible: false,
    );
  }

  static Dialog _buildDialog(VoidCallback onConfirm,{String? title,String? content,String? confirm, String? cancel,VoidCallback? onCancel}){
    return Dialog(
        elevation: 2.0,
        backgroundColor: Colors.white,
        insetAnimationDuration: const Duration(seconds: 2),
        insetAnimationCurve: Curves.decelerate,
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
                      child: Text(title?? '温馨提示',style: TextStyle(color: Colors.black87,fontSize: 16.sp,fontWeight: FontWeight.bold),)
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(content?? '请确认',style: TextStyle(color: Colors.black87,fontSize: 14.sp),),
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
                                  onPressed: onConfirm,
                                  child: Text(confirm?? '确定',style: const TextStyle(fontSize: 14, color: Colors.blue))
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
                              onPressed: onCancel?? dismiss,
                              child: Text(cancel?? '取消', style: const TextStyle(fontSize: 14, color: Colors.blue)),
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

  static void dismiss() {
    LogUtils.GGQ('====dismiss======>>>');
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  // static late BuildContext mContext;
  //
  // static show(BuildContext context,{String? title,String? content,String? confirm, String? cancel,Function? onConfirm,Function? onCancel}) {
  //   mContext = context;
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Dialog(
  //           elevation: 2.0,
  //           backgroundColor: Colors.white,
  //           insetAnimationDuration: const Duration(seconds: 2),
  //           insetAnimationCurve: Curves.easeOutCubic,
  //           shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
  //           child: Container(
  //               width: getWidth(),
  //               height: 0.20.sh,
  //               child: Column(
  //                 children: [
  //                   Expanded(
  //                     flex: 8,
  //                     child: Container(
  //                         alignment: Alignment.center,
  //                         decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(18.0))),
  //                         child: Text(title?? '温馨提示',style: TextStyle(color: Colors.black87,fontSize: 16.sp,fontWeight: FontWeight.bold),)
  //                     ),
  //                   ),
  //                   Expanded(
  //                     flex: 9,
  //                     child: Container(
  //                       alignment: Alignment.center,
  //                       child: SingleChildScrollView(
  //                         scrollDirection: Axis.vertical,
  //                         child: Text(content?? '请确认',style: TextStyle(color: Colors.black87,fontSize: 14.sp),),
  //                       ),
  //                     ),
  //                   ),
  //                   const Divider(height: .2,color: Colors.grey,thickness: .2),
  //                   Expanded(
  //                     flex: 9,
  //                     child: Container(
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                           children: [
  //                             Expanded(
  //                                 flex: 1,
  //                                 child: TextButton(
  //                                     style: ButtonStyle(
  //                                       minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, double.maxFinite)),
  //                                       shape: MaterialStateProperty.all(const RoundedRectangleBorder(
  //                                         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18)),
  //                                       )),
  //                                     ),
  //                                     onPressed: ()=> onConfirm?? dismiss(),
  //                                     child: Text(confirm?? '确定',style: const TextStyle(fontSize: 14, color: Colors.blue))
  //                                 )
  //                             ),
  //                             const VerticalDivider(width: .2,color: Colors.grey,thickness: .2),
  //                             Expanded(
  //                               flex: 1,
  //                               child: TextButton(
  //                                 style: ButtonStyle(
  //                                   minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, double.maxFinite)),
  //                                   shape: MaterialStateProperty.all(const RoundedRectangleBorder(
  //                                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(18)),
  //                                   )),
  //                                 ),
  //                                 onPressed: () => onCancel?? dismiss(),
  //                                 child: Text(cancel?? '取消', style: const TextStyle(fontSize: 14, color: Colors.blue)),
  //                               ),)
  //                           ],
  //                         )
  //                     ),
  //                   ),
  //                 ],
  //               )
  //           )
  //         );
  //       }
  //   );
  // }
  //
  // static dismiss(){
  //   Navigator.of(mContext).pop();
  // }
}