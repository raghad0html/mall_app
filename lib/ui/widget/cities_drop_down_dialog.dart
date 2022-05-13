import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/city/models/city_model.dart';

import '../../../generated/l10n.dart';

typedef SelectedCity = void Function(CityModel);

class CitiesDropDownDialog extends StatefulWidget {
  const CitiesDropDownDialog({
    Key? key,
    required this.cities,
    required this.selectedCity,
  }) : super(key: key);

  final List<CityModel> cities;
  final SelectedCity selectedCity;

  @override
  State<CitiesDropDownDialog> createState() => _CitiesDropDownDialogState();
}

class _CitiesDropDownDialogState extends State<CitiesDropDownDialog> {
  late CityModel city;

  @override
  void initState() {
    super.initState();
    city = widget.cities.first;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).chooseCurrentCity),
      content: DropdownButtonHideUnderline(
        child: DropdownButton<CityModel>(
          hint: const Text("--"),
          value: city,
          items: widget.cities.map((value) {
            return DropdownMenuItem<CityModel>(
              value: value,
              child: Text(value.cityName ?? ''),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              city = value!;
            });
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(S.of(context).ok),
          onPressed: () {
            widget.selectedCity(city);
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
