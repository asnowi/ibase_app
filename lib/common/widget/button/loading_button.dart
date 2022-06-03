import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ibase_app/common/utils/utils.dart';

class LoadingButton extends StatefulWidget{
  String text;
  Function onPressed;
  String? loadingText;
  TextStyle? textStyle;
  double? width;
  double? height;
  Color? loadingColor;
  ButtonStyle? buttonStyle;

  bool isLoading = false;

  _LoadingButtonState? _state;

  LoadingButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.loadingText,
      this.textStyle,
      this.width,
      this.height,
      this.loadingColor,
      this.buttonStyle})
      : super(key: key);

  @override
  State<LoadingButton> createState() {
    _state = _LoadingButtonState();
    return _state!;
  }

  void onCancel(){
    _state?.reset();
  }
}

class _LoadingButtonState extends State<LoadingButton>{

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width ?? getWidth() / 3,
        height: widget.height ?? 38.h,
        child: TextButton(
          style: widget.buttonStyle?? ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                if (states.contains(MaterialState.focused) &&
                    !states.contains(MaterialState.pressed)) {
                  return Colors.grey[300];
                } else if (states.contains(MaterialState.pressed)) {
                  return Colors.white60;
                }
                return Colors.white;
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.redAccent[100];
              }
              return Colors.redAccent[100];
            }),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            )),
          ),
          onPressed: () {
            if(!widget.isLoading) {
              widget.onPressed();
            }
            setState(() {
              widget.isLoading = true;
            });
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: Row(
              key: ValueKey<bool>(widget.isLoading),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: widget.isLoading,
                  maintainState: false,
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: SpinKitRing(
                      color: widget.loadingColor ?? Colors.white60,
                      size: 13.0,
                      lineWidth: 1.0,
                    ),
                  ),
                ),
                Visibility(
                    visible: widget.isLoading,
                    maintainState: false,
                    child: const Padding(padding: EdgeInsets.only(right: 6))),
                Text(widget.isLoading ? widget.loadingText ?? '请稍后...' : widget.text,
                    style: widget.textStyle),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    reset();
    super.dispose();
  }

  void reset(){
    setState(() {
      widget.isLoading = false;
    });
  }
}
