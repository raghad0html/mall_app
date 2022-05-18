import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../main_sdk/apis/mall/models/mall_model.dart';

typedef SelectedMall = void Function(MallModel);

class MallsDropDownDialog extends StatefulWidget {
  const MallsDropDownDialog({
    Key? key,
    required this.malls,
    required this.selectedMall,
  }) : super(key: key);

  final List<MallModel> malls;
  final SelectedMall selectedMall;

  @override
  State<MallsDropDownDialog> createState() => _MallsDropDownDialogState();
}

class _MallsDropDownDialogState extends State<MallsDropDownDialog> {
  late MallModel mall;
  @override
  void initState() {
    super.initState();
    mall = widget.malls.first;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).chooseMall),
      content: DropdownButtonHideUnderline(
        child: DropdownButton<MallModel>(
          hint: Text(S.of(context).dash),
          value: mall,
          items: widget.malls.map((value) {
            return DropdownMenuItem<MallModel>(
              value: value,
              child: Text(value.name ?? ''),
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
        TextButton(
          child: Text(S.of(context).ok),
          onPressed: () {
            widget.selectedMall(mall);
          },
        ),
        TextButton(
          child: Text(S.of(context).cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
