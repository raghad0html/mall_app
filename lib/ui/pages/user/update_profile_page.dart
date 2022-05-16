import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/local_storage/shared_prefernce_services.dart';
import 'package:mall_app/main_sdk/apis/city/models/city_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/update_profile_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/user_model.dart';
import 'package:mall_app/ui/pages/user/user_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class UpdateProfilePage extends StatefulWidget {
  final UserModel userModel;
  final Function(UserModel) onChanged;

  const UpdateProfilePage(
      {Key? key, required this.userModel, required this.onChanged})
      : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends StateMVC<UpdateProfilePage> {
  late UserController _con;

  _UpdateProfilePageState() : super(UserController()) {
    _con = controller as UserController;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  int? cityId;
  String? cityName;

  @override
  void initState() {
    super.initState();
    _con.getCity();
    emailController.text = widget.userModel.email ?? '';
    nameController.text = widget.userModel.name ?? '';
    phoneController.text = widget.userModel.phone ?? '';
    cityId = widget.userModel.cityId;
    cityName = widget.userModel.cityName;
    _con.city = CityModel(cityId: cityId, cityName: cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('تعديل الملف الشخصي'),
        ),
        body: _con.cities.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _con.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: 'الاسم الكامل',
                              labelText: 'الاسم الكامل',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الاسم الكامل';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: S.of(context).email,
                              labelText: S.of(context).email,
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains('@') ||
                                  !value.contains('.')) {
                                return S.of(context).enterEmail;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'رقم الهاتف',
                              labelText: 'رقم الهاتف',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى ادخال رقم الهاتف';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: AppColors.grayColor),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<CityModel>(
                                hint: const Text("--"),
                                value: _con.city,
                                items: _con.cities.map((value) {
                                  return DropdownMenuItem<CityModel>(
                                    value: value,
                                    child: Text(value.cityName ?? ''),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _con.city = value!;
                                    cityName = value.cityName;
                                    cityId = value.cityId;
                                  });
                                },
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _con.updateProfile(
                                      updateProfileParamsModel:
                                          UpdateProfileParamsModel(
                                              cityId: cityId ?? 0,
                                              phone: phoneController.text,
                                              name: nameController.text,
                                              email: emailController.text,
                                              token:
                                                  LocalStorageService().token ??
                                                      '',
                                              userid: LocalStorageService().id??''));

                                  widget.onChanged(UserModel(
                                      token: LocalStorageService().token ?? '',
                                      userId: int.tryParse(
                                          LocalStorageService().id ?? '0'),
                                      email: emailController.text,
                                      name: nameController.text,
                                      phone: phoneController.text));
                                },
                                child: const Text('حفظ'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )));
  }
}
