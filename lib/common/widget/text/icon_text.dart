import 'package:ibase_app/common/utils/utils.dart';

class IconText extends StatelessWidget {

  final String txt;
  final Icon icon;
  final bool isNext;
  final Function onClick;
  final Widget? centerChild;

  IconText({required this.txt, required this.icon,required this.onClick,this.isNext = true,this.centerChild});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: ()=> onClick(),
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(getWidth(), 46.h)),
              backgroundColor: MaterialStateProperty.all(Colors.white)
          ),
          child: SizedBox(
              width: getWidth(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon,
                  const Padding(padding: EdgeInsets.only(left: 4)),
                  Expanded(
                    flex: 1,
                    child: Text(txt,style: const TextStyle(fontSize: 12,color: Colors.black87),)),
                  // Expanded(child: centerChild?? Container()),
                  centerChild == null? Container(): Expanded(flex: 1,child: centerChild!),
                  Offstage(
                    offstage: !isNext,
                    child: const Icon(Icons.arrow_forward_ios_sharp,size: 12,color:Colors.grey),
                  )
                ],
              )
          ),
        ),
      ],
    );
  }
}