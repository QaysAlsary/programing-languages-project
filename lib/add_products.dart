import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class AddProducts extends StatefulWidget {
  static const String addProductsRout = 'AddProudcts';

  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var dateController = TextEditingController();
  var quantityController = TextEditingController();
  var priceController = TextEditingController();
  var firstDiscController = TextEditingController();
  var secondDiscController = TextEditingController();
  var thirdDiscController = TextEditingController();
  String dropdownValue = 'fruits';
  var items = [
    'fruits',
    'vegetable',
    'meat',
    'canned food',
  ];

  var formKey = GlobalKey<FormState>();

  //  late File _image;
  // final picker= ImagePicker();
  // Future getImage() async{
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     if(pickedFile!=null){
  //       _image =File(pickedFile.path);
  //     }else{
  //       print('no image selected');
  //     }
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add Products',
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                if (formKey.currentState!.validate()) {
                  print('batata');
                }
              });
            },
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,

                    // child: _image==null? Center(child: Text('No image selected')):Image.file(_image),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Product name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                    ),
                    validator: (vlaue) {
                      if (vlaue!.isEmpty) {
                        return 'name must not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'The quantity',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                    ),
                    validator: (vlaue) {
                      if (vlaue!.isEmpty) {
                        return 'phone number must not be empty';
                      } else if (vlaue.length < 10) {
                        return "Phone number must be atleast 10 numbers long";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: dateController,
                    keyboardType: TextInputType.datetime,
                    onTap: () {
                      setState(() {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2031-09-06'))
                            .then((value) {
                          dateController.text = value.toString();
                        });
                      });
                    },
                    validator: (vlaue) {
                      if (vlaue!.isEmpty) {
                        return 'date must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Expiration date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  DropdownButton(
                    value: dropdownValue,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('the price  ')),
                      Container(
                        width: 75,
                        child: TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                          ),
                          validator: (vlaue) {
                            if (vlaue!.isEmpty) {
                              return 'price must not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('the initial discaont value ')),
                      Container(
                        width: 75,
                        child: TextFormField(
                          controller: firstDiscController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                          ),
                          validator: (vlaue) {
                            if (vlaue!.isEmpty) {
                              return 'discaont must not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                              'the discaont value 30 dayes befor the expiration date')),
                      Container(
                        width: 75,
                        child: TextFormField(
                          controller: secondDiscController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                          ),
                          validator: (vlaue) {
                            if (vlaue!.isEmpty) {
                              return 'discaont must not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                              'the discaont value 15 dayes befor the expiration date')),
                      Container(
                        width: 75,
                        child: TextFormField(
                          controller: thirdDiscController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                          ),
                          validator: (vlaue) {
                            if (vlaue!.isEmpty) {
                              return 'discaont must not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () {
          // getImage();
        },
      ),
    );
  }
}
