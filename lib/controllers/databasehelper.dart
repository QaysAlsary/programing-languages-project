import 'dart:convert';

import 'package:http/http.dart' as http;

import '../products.dart';

var qays;

class DatabaseHelper {
  String serverUrl = 'http://192.168.43.213:8000/api';

  //When I do an operation to know if it succeeded or not
  var status;
  var like;
  var token;

  // var qays;

  // registerData (
  //     String userName,
  //     String email,
  //     String password,
  //     String passwordConfirmation,
  //     ) async
  // {
  //
  //   String registerUrl = '$serverUrl/register' ;
  //
  //   final response = await http.post(
  //     Uri.parse('$registerUrl') ,
  //     headers: {
  //       'Accept':'application/json'
  //     },
  //     body: {
  //       'name':'$userName',
  //       'email':'$email',
  //       'password':'$password',
  //       'password_confirmation':'$passwordConfirmation',
  //     },
  //   ).then((value) {
  //     var data = json.decode(value.body);
  //     qays= data['access_token'];
  //     print('token: $qays');
  //   });
  //
  //   // status = response.body.contains('error');
  //
  //
  //
  // }

  Future? registerData(
    String userName,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    String registerUrl = '$serverUrl/register';
    Uri url = Uri.parse('$registerUrl');
    final response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {
        'name': '$userName',
        'email': '$email',
        'password': '$password',
        'password_confirmation': '$passwordConfirmation',
      },
    ).then((value) {
      var data = json.decode(value.body);

      if (value.statusCode == 200) {
        status = false;

        qays = data['access token'];
      }
    });
  }

  Future? login(
    String email,
    String password,
  ) async {
    String registerUrl = '$serverUrl/login';
    Uri url = Uri.parse('$registerUrl');
    final response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {
        'email': '$email',
        'password': '$password',
      },
    ).then((value) {
      print(value.toString());
      print(value.statusCode);
      var data = json.decode(value.body);

      if (value.statusCode == 200) {
        status = false;

        qays = data['access_token'];
      }
    });
  }

  Future<Products>? getOneProduct(int id) async {
    String registerUrl = '$serverUrl/show_product/$id';
    Uri url = Uri.parse(registerUrl);
    return await http.get(
      url,
      headers: {'Accept': 'application/json', "Authorization": "Bearer $qays"},
    ).then((value) {
      var map = jsonDecode(value.body);

      Products product = Products.fromJson(map['product']);
      product.price = map['discount_price'] * 1.0;
      return product;
    });
  }

  Future? getProducts() async {
    String registerUrl = '$serverUrl/home';
    Uri url = Uri.parse('$registerUrl');
    return await http.get(
      url,
      headers: {'Accept': 'application/json', "Authorization": "Bearer $qays"},
    ).then((value) {
      List<Products> myProducts = [];

      if (value.statusCode == 200) {
        status = false;

        final data = json.decode(value.body).cast<Map<String, dynamic>>();

        var map = json.decode(value.body);
        map.forEach((value) {
          myProducts.add(Products.fromJson(value));
        });
        return myProducts;
      } else {
        throw Exception('hghg');
      }
    });
  }

  Future? logout() async {
    String loginUrl = '$serverUrl/logout';
    Uri url = Uri.parse('$loginUrl');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $qays',
      },
    ).then((value) {
      // var data = json.decode(value.body);

      if (value.statusCode == 200) {
        status = false;
      }
    });
  }

// Future? getWatches (
//    int id
//     ) async
// {
//
//   String registerUrl = '$serverUrl/show_product/$id' ;
//   Uri url = Uri.parse('$registerUrl');
//   final response= await http.post(
//     url,
//     headers: {
//       'Accept':'application/json',
//       "Authorization":"Bearer $qays"
//     },
//
//
//
//   ).then((value){
//     print(value.toString());
//     print(value.statusCode);
//     var data = json.decode(value.body);
//
//     if(value.statusCode == 200){
//       status = false;
//
//       like=data['likes'];
//     }
//     print("ppppppppppppppppp0$qays");
//
//   });}

// login (
//     String email,
//     String password,
//     ) async
// {
//
//   String loginUrl = '$serverUrl/login' ;
//
//   final response = await http.post(
//     Uri.parse('$loginUrl') ,
//     headers: {
//       'Accept':'application/json'
//     },
//     body: {
//       'email':'$email',
//       'password':'$password',
//     },
//   );
//
//   status = response.body.contains('error');
//   var data = json.decode(response.body);
//
//   if(status){
//     print('data:${data['error']}');
//   }else{
//     print('data:${data['token']}');
//     _save(data['token']);
//   }
// }
//
// Future<List> home () async
// {
//
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'token';
//   final value = prefs.get(key) ?? 0;
//
//   String homeUrl = '$serverUrl/home' ;
//
//   http.Response response = await http.get(
//     Uri.parse('$homeUrl') ,
//     headers: {
//       'Accept':'application/json',
//       'Authorization' : 'Bearer $value',//value=token
//     },
//   );
//   return json.decode(response.body);
// }
//
// //need id to delete product
// void deleteProduct (int id) async
// {
//
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'token';
//   final value = prefs.get(key) ?? 0;
//
//   String deleteProductUrl = '$serverUrl/delete_product/3/$id' ;
//
//   http.delete(
//     Uri.parse('$deleteProductUrl') ,
//     headers: {
//       'Accept':'application/json',
//       'Authorization' : 'Bearer $value',//value=token
//     },
//   ).then((response){
//     print ('Response states: ${response.statusCode}');
//     print ('Response body: ${response.body}');
//   });
//
// }
//
// void addProduct (
//     String name,
//     String image,
//     String category,
//     int quantity,
//     double price,
//     String expiryDate,
//     String phoneNumber,
//     double disCount1,
//     double disCount2,
//     double disCount3,
//     ) async
// {
//
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'token';
//   final value = prefs.get(key) ?? 0;
//
//   String addProductUrl = '$serverUrl/add_product' ;
//
//   http.post(
//     Uri.parse('$addProductUrl') ,
//     headers: {
//       'Accept':'application/json',
//       'Authorization' : 'Bearer $value',//value=token
//     },
//     body: {
//       'name':'$name',
//       'image':'$image',
//       'category':'$category',
//       'quantity':'$quantity',
//       'price':'$price',
//       'expiry_date':'$expiryDate',
//       'phone_number':'$phoneNumber',
//       'discount1':'$disCount1',
//       'discount2':'$disCount2',
//       'discount3':'$disCount3',
//     },
//   ).then((response){
//     print ('Response states: ${response.statusCode}');
//     print ('Response body: ${response.body}');
//   });
//
// }
//
// void editProduct (
//     int id,
//     String name,
//     String image,
//     String category,
//     int quantity,
//     double price,
//     String phoneNumber,
//     double disCount2,
//     double disCount3,
//     ) async
// {
//
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'token';
//   final value = prefs.get(key) ?? 0;
//
//   String editProductUrl = '$serverUrl/update_product/2/$id' ;
//
//   http.post(
//     Uri.parse('$editProductUrl') ,
//     headers: {
//       'Accept':'application/json',
//       'Authorization' : 'Bearer $value',//value=token
//     },
//     body: {
//       'name':'$name',
//       'image':'$image',
//       'category':'$category',
//       'quantity':'$quantity',
//       'price':'$price',
//       'phone_number':'$phoneNumber',
//       'discount2':'$disCount2',
//       'discount3':'$disCount3',
//     },
//   ).then((response){
//     print ('Response states: ${response.statusCode}');
//     print ('Response body: ${response.body}');
//   });
//
// }
//
// Future<List> profile () async
// {
//
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'token';
//   final value = prefs.get(key) ?? 0;
//
//   String profileUrl = '$serverUrl/profile' ;
//
//   http.Response response = await http.get(
//     Uri.parse('$profileUrl') ,
//     headers: {
//       'Accept':'application/json',
//       'Authorization' : 'Bearer $value',//value=token
//     },
//   );
//   return json.decode(response.body);
// }
//
// Future<List> details (int id) async
// {
//
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'token';
//   final value = prefs.get(key) ?? 0;
//
//   String detailsUrl = '$serverUrl/show_product/2/$id' ;
//
//   http.Response response = await http.get(
//     Uri.parse('$detailsUrl') ,
//     headers: {
//       'Accept':'application/json',
//       'Authorization' : 'Bearer $value',//value=token
//     },
//   );
//   return json.decode(response.body);
// }
//
//
//
//
//
// //private function to save token in application
// _save(String token) async
// {
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'token';
//   final value = token ;
//   prefs.setString(key, value);
// }
//
// //public function to read token
// read () async {
//   final prefs = await SharedPreferences.getInstance();
//   final key = ' token';
//   final value = prefs.get(key) ?? 0;//return kek if exits or 0 if not
//   print ('read : $value');
// }

}
