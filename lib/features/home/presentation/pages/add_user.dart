import 'package:cps_mobile/cores/routes/app_pages.dart';
import 'package:cps_mobile/cores/utils/constant/colors.dart';
import 'package:cps_mobile/cores/utils/validators/form_validator.dart';
import 'package:cps_mobile/cores/widgets/custom_textfield.dart';
import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../bloc/add_user/add_user_bloc.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool isFormValid = false;
  @override
  void initState() {
    super.initState();
    nameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    phoneController.addListener(_validateForm);
    cityController.addListener(_validateForm);
    addressController.addListener(_validateForm);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Tambah user",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AddUserBloc, AddUserState>(
        listener: (context, state) {
          if (state is AddUserLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Yeay!!! Berhasil menambahkan data"),
              ),
            );
            Get.offNamed(Routes.HOME);
          } else if (state is AddUserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Gagal menambahkan data"),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.grey,
                content: Center(child: CircularProgressIndicator()),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nama : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomTextField(
                      validator: FormValidator.required,
                      controller: nameController,
                      hintText: "Masukan nama"),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Email : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomTextField(
                      validator: FormValidator.email,
                      controller: emailController,
                      hintText: "example@gmail.com"),
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    "Nomor Hp : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomTextField(
                      validator: FormValidator.phone,
                      controller: phoneController,
                      hintText: "08*************"),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Kota : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomTextField(
                      validator: FormValidator.required,
                      controller: cityController,
                      hintText: "contoh : Jakarta"),
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    "Alamat Lengkap : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomTextField(
                      maxLines: 5,
                      validator: FormValidator.required,
                      controller: addressController,
                      hintText: "Masukan alamat lengkap"),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor),
                        onPressed: isFormValid
                            ? () {
                                UserModel payload = UserModel(
                                    name: nameController.text,
                                    address: addressController.text,
                                    email: emailController.text,
                                    phoneNumber: phoneController.text,
                                    city: cityController.text);

                                context
                                    .read<AddUserBloc>()
                                    .add(DoAddUser(payload: payload));
                              }
                            : null,
                        child: const Text(
                          "SIMPAN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
