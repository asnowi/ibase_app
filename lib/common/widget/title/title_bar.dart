import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final VoidCallback? onBack;


  const TitleBar({required this.title,this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 72,
      child: SafeArea(
        top: true,
        child: Stack(
          children: [
            Visibility(
              visible: (onBack == null)? true: false,
              child: IconButton(icon: const Icon(Icons.arrow_back_ios_sharp,size: 14,), onPressed: ()=> onBack),
            ),
            Center(
              child: Text(title,style:  const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: 'FZFWQingYinTiJWL',
              ),),
            )
          ],
        ),
      ),
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(42);
}
