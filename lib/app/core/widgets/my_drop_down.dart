import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/asset_constants.dart';
import '../model/app_helper_model/drop_down_list_item.dart';
import '../utils/style/app_style.dart';

class MyDropDown extends StatelessWidget {
  final dynamic dropDownItem;
  final dynamic selectedItem;
  final Function handleClick;
  final String hint;

  final double radius;
  final FocusNode? focusNode;
  final bool isPrefixIconNeeded, isUnderLineRequired;

  const MyDropDown(
    this.dropDownItem,
    this.selectedItem,
    this.handleClick,
    this.hint, {
    Key? key,
    this.radius = 8.0,
    this.focusNode,
    this.isPrefixIconNeeded = true,
    this.isUnderLineRequired = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<DropdownListItemModel>> dropdownMenuItems =
        buildDropDownMenuItems(dropDownItem);
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          style: textRegularStyle(),
          icon: const Icon(Icons.arrow_drop_down_rounded),
          hint: Text(
            hint,
            style: hintStyle,
          ),
          focusNode: focusNode,
          value: selectedItem,
          items: dropdownMenuItems,
          isExpanded: true,
          onChanged: (value) {
            handleClick(value, dropDownItem.indexOf(value));
          }),
    );
  }

  List<DropdownMenuItem<DropdownListItemModel>> buildDropDownMenuItems(
      List listItems) {
    List<DropdownMenuItem<DropdownListItemModel>> items = [];
    for (DropdownListItemModel listItem in listItems) {
      // debugPrint('buildDropDownMenuItems:  ${listItem.value}');
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(
            listItem.name.toString(),
            style: const TextStyle(fontSize: 14),
          ),
        ),
      );
    }
    return items;
  }
}
