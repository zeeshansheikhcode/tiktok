import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/searchUser_controller.dart';
import '../../model/user_model.dart';
import 'profile_screen.dart';
class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
TextEditingController searchQuery = TextEditingController();

final SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          appBar: AppBar(
            title: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Search Username"
                ),
            
            controller: searchQuery ,
             onFieldSubmitted: (value){
              searchController.searchUser(value);
            },),
          ),
          body:  searchController.searchedUsers.isEmpty 
          ?
           const 
            Center(
            child: Text("Search Users!"),
            )
          :
          ListView.builder(
              itemCount: searchController.searchedUsers.length,
              itemBuilder: (context, index){
            myUser user = searchController.searchedUsers[index];
            return ListTile(
              onTap: (){
              Navigator.push(context,
               MaterialPageRoute(
                builder: (context)=>ProfileScreen(uid: user.uid)));
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  user.profilePhoto
                ),
              ),
              title: Text(user.name),
            );
          })
          ,
        );
      }
    );
  }
}
