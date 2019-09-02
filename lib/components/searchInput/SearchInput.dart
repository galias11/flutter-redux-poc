// @Vendors
import 'package:flutter/material.dart';

// @Styles
import 'package:workshop_twitter/theme/default/index.dart';

// @I18n
import 'package:workshop_twitter/config/lang/i18n.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController textfieldController;
  final Function onPerformSearch;
  final Function onChangeSearchValue;

  SearchInput({
    @required this.textfieldController,
    @required this.onPerformSearch,
    @required this.onChangeSearchValue
  });

  Widget buildInput(BuildContext context) {
    return new  Expanded(
      flex: 7,
      child: Container(
        padding: EdgeInsets.only(right: 10.0),
        height: 50,
        child: TextField(
          controller: textfieldController,
          onChanged: onChangeSearchValue,
          maxLines: 1,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: new InputDecoration(
            hintText: getTranslation('searchScreen', 'search'),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorTheme.borderPrimary,
                width: 0.0
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorTheme.backgroundIndicator,
                width: 0.0
              ),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: ColorTheme.backgroundIndicator
            )
          )
        )
      )
    );
  }

  Widget buildButton() {
    return new Expanded(
      flex: 3,
      child: Container(
        height: 50.0,
        padding: EdgeInsets.only(left: 10.0),
        child: RaisedButton(
          color: ColorTheme.backgroundIndicator,
          onPressed: onPerformSearch,
          child: Text(
            getTranslation('searchScreen', 'search'),
            style: FontTheme.buttonGhost
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context){
    return new Padding (
      padding: EdgeInsets.only(
        top: 15.0,
        bottom: 10.0,
        left: 15.0,
        right: 15.0
      ),
      child: Row(
        children: <Widget>[
          buildInput(context),
          buildButton()
        ],
      )
    );
  }
}