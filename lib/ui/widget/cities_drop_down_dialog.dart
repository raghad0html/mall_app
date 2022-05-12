import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../main_sdk/apis/mall/models/mall_model.dart';

typedef SelectedMall = void Function(MallModel);

class CitiesDropDownDialog extends StatefulWidget {
  const CitiesDropDownDialog({
    Key? key,
    required this.malls,
    required this.selectedMall,
  }) : super(key: key);

  final List<MallModel> malls;
  final SelectedMall selectedMall;

  @override
  State<CitiesDropDownDialog> createState() => _CitiesDropDownDialogState();
}

class _CitiesDropDownDialogState extends State<CitiesDropDownDialog> {
  late MallModel mall;
  @override
  void initState() {
    super.initState();
    mall = widget.malls.first;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).chooseCurrentCity),
      content: DropdownButtonHideUnderline(
        child: DropdownButton<MallModel>(
          hint: const Text("--"),
          value: mall,
          items: widget.malls.map((value) {
            return DropdownMenuItem<MallModel>(
              value: value,
              child: Text(value.cityName ?? ''),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              mall = value!;
            });
          },
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(S.of(context).ok),
          onPressed: () {
            widget.selectedMall(mall);
          },
        ),
        FlatButton(
          child: Text(S.of(context).cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
