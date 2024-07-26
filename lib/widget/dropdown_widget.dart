import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/theme/app_theme.dart';

class DropdownWidget<T> extends StatelessWidget {
  final Future<List<T>> Function(String)? asyncItems;
  final PopupProps<T> popupProps;
  final void Function(T?)? onChanged;
  final String Function(T)? itemAsString;
  final T? selectedItem;
  final Widget Function(BuildContext, T, bool)? itemBuilder;
  final bool showSearchBox;
  final TextEditingController? searchController;
  final String? hintText;
  final List<T> items;
  final double? maxHeight;
  final bool showSelectedItems;
  final String? Function(T?)? validator;
  const DropdownWidget(
      {super.key,
      this.itemAsString,
      this.asyncItems,
      this.popupProps = const PopupProps.menu(),
      this.onChanged,
      this.selectedItem,
      this.itemBuilder,
      this.showSearchBox = true,
      this.searchController,
      this.hintText,
      this.items = const [],
      this.maxHeight,
      this.showSelectedItems = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      selectedItem: selectedItem,
      itemAsString: itemAsString,
      asyncItems: asyncItems,
      dropdownDecoratorProps: DropDownDecoratorProps(
        textAlign: TextAlign.center,
        baseStyle: AppTextStyle.regular14(color: Colors.black),
        dropdownSearchDecoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, left: 10),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          hintText: hintText,
          hintStyle: AppTextStyle.regular14(
            color: Colors.blueGrey,
          ),
          errorStyle: AppTextStyle.regular14(color: Colors.red),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
      items: items,
      validator: validator,
      popupProps: PopupPropsMultiSelection.menu(
        menuProps: const MenuProps(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        constraints: BoxConstraints(maxHeight: maxHeight ?? 300),
        fit: FlexFit.tight,
        showSearchBox: false,
        showSelectedItems: false,
        searchFieldProps: TextFieldProps(
          style: AppTextStyle.regular16(color: Colors.black),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "Search Something...",
            hintStyle: AppTextStyle.regular16(color: Colors.black),
          ),
        ),
        itemBuilder: itemBuilder,
        loadingBuilder: ((context, searchEntry) {
          return Container(
            padding: const EdgeInsets.only(top: 10),
            alignment: Alignment.topCenter,
            child: Text(
              "Loading...",
              style: AppTextStyle.regular16(),
            ),
          );
        }),
        emptyBuilder: (context, searchEntry) {
          return Container(
            alignment: Alignment.topCenter,
            child: Text(
              "notfound".tr,
              style: AppTextStyle.regular16(),
            ),
          );
        },
      ),
      onChanged: onChanged,
    );
  }
}
