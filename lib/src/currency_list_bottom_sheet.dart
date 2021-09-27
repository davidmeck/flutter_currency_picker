import 'package:currency_picker/src/currency.dart';
import 'package:flutter/material.dart';

import 'currency_list_view.dart';
import 'currency_picker_theme_data.dart';

void showCurrencyListBottomSheet({
  required BuildContext context,
  required ValueChanged<Currency> onSelect,
  List<String>? favorite,
  List<String>? currencyFilter,
  String? searchHint,
  String? title,
  bool showFlag = true,
  bool showCurrencyName = true,
  bool showCurrencyCode = true,
  ScrollPhysics? physics,
  CurrencyPickerThemeData? theme,
}) {
  final ShapeBorder shape = theme?.shape ??
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      );

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    // ),
    // backgroundColor: theme?.backgroundColor,
    builder: (_) => _builder(
        context,
        onSelect,
        favorite,
        currencyFilter,
        searchHint,
        physics,
        showFlag,
        showCurrencyName,
        showCurrencyCode,
        theme,
        title),
  );
}

Widget _builder(
  BuildContext context,
  ValueChanged<Currency> onSelect,
  List<String>? favorite,
  List<String>? currencyFilter,
  String? searchHint,
  ScrollPhysics? physics,
  bool showFlag,
  bool showCurrencyName,
  bool showCurrencyCode,
  CurrencyPickerThemeData? theme,
  String? title,
) {
  final BoxDecoration decoration = BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(20));

  return DraggableScrollableSheet(
    expand: false,
    maxChildSize: 0.9,
    initialChildSize: 0.6,
    minChildSize: 0.5,
    builder: (BuildContext context, ScrollController controller) {
      return Container(
        decoration: decoration,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: CurrencyListView(
          onSelect: onSelect,
          searchHint: searchHint,
          showFlag: showFlag,
          showCurrencyName: showCurrencyName,
          showCurrencyCode: showCurrencyCode,
          favorite: favorite,
          currencyFilter: currencyFilter,
          controller: controller,
          physics: physics,
          theme: theme,
          title: title,
        ),
      );
    },
  );
}
