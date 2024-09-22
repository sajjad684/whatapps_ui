import 'package:flutter/material.dart';
import 'package:whatapps_ui/home_view/message_view/message_view.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
    List chatlist=[
  {'name':'Sajjad Ali',
  'message': 'Hellow',
  'image':'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
  'count': 0},
  {'name':'Sajjad Ali',
    'message': 'Hi, How are you?',
    'image':'https://cdn-icons-png.flaticon.com/512/5556/5556499.png',
    'count': 2},
  {'name':'Sajjad Ali',
    'message': 'Hello, how are you?',
    'image':'https://cdni.iconscout.com/illustration/premium/thumb/female-avatar-illustration-download-in-svg-png-gif-file-formats--young-woman-girl-portraits-pack-people-illustrations-6590630.png',
    'count': 1},
];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF075e55),
          title: Text("WhatApps", style: TextStyle(fontSize: 20, color: Colors.white,
              fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){},
          icon: Icon(Icons.search,color: Colors.white.withOpacity(0.7))),
        IconButton(onPressed: (){},
            icon: Icon(Icons.more_vert,color: Colors.white.withOpacity(0.7))),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab ,
            indicatorColor: Colors.white,
            unselectedLabelColor:Colors.white.withOpacity(0.7),
            labelColor: Colors.white,
              tabs: [
            Tab(
              icon: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt)),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALL',
            ),
          ]),
        ),
        body: TabBarView(children: [
          Text('Tab 1'),
          ListView.builder(
              itemCount: chatlist.length,
              itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                 return MessageView(name: chatlist[index]['name'], image: chatlist[index]['image'], message: chatlist[index]['message'],);
                }));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(chatlist[index]['image']),
                // foregroundImage:NetworkImage(chatlist[index]['image']) ,
                // child: Image.network(chatlist[index]['image'],fit: BoxFit.fitWidth,),
                // backgroundColor: Colors.teal,
                // foregroundColor: Colors.red,
              ) ,
              title: Text(chatlist[index]['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),) ,
              subtitle:Text(chatlist[index]['message'],
                maxLines: 1, overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black.withOpacity(0.8)),),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('1:09 PM',
                    style: TextStyle(color: chatlist[index]['count']>0? Colors.green: Colors.black),),
                  chatlist[index]['count']==0?SizedBox():Container(
                    decoration: BoxDecoration(
                      color:Colors.green,
                      shape: BoxShape.circle,
                    ),
                    width: 25,
                    height: 25,
                    child: Center(child: Text(chatlist[index]['count'].toString(), style: TextStyle(fontSize: 16),)),
                  )
                ],
              ),
            );
          }),

          Text('Tab3'),
          Text('TAb4'),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor:Color(0xFF075e55) ,
          onPressed: (){},child: Icon(Icons.message,color: Colors.white,),),
      ),
    );
  }
}
