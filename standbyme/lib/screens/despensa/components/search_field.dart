import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
//import 'package:flutter_svg/svg.dart';

//import '../../../constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 15),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
      ),
      child: TextField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
            ),
            fillColor: Colors.transparent,
            hintText: 'Pesquisar...',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: kPrimaryColor,
              ),
            )),
      ),
    );
  }
}
