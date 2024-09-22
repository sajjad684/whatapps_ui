import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  final String name;
  final String image;
  final String message;
   MessageView({super.key, required this.name, required this.image, required this.message});
  List chatMessage = [
    {"name": 'sajjad'},
    {'name':'saju'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        titleSpacing: 5,
        backgroundColor: Color(0xFF075e55),
        leading: IconButton(onPressed: (){
                  Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back, color: Colors.white,)),
        title: Expanded(child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(image),),
          title: Text(name, style: TextStyle(color: Colors.white),),
          subtitle: Text('Last Seen 11.00 Am',
            style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 11),),
        )),
        actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 40,
                  child: IconButton( padding: EdgeInsets.zero,onPressed: (){}, icon: Icon(Icons.call, color: Colors.white),),
                ),
                IconButton(iconSize:18,onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white)),
              ],
            ),
        ],
        ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatMessage.length,
                itemBuilder: (context, index){
              return Column(
                crossAxisAlignment: chatMessage[index]['name']=='sajjad'?CrossAxisAlignment.end: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration:BoxDecoration(
                      borderRadius:chatMessage[index]['name']!='sajjad'? BorderRadius.only(topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(25)): BorderRadius.only(topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(15)
                      ),
                        color: Colors.teal,
                            ),
            
                      padding: EdgeInsets.only(left: 15, top: 5, bottom: 10 , right: 10),
                      margin: EdgeInsets.only(bottom: 5, top: 5),
            
            
                      child: Text("hello vvvvvvvvv", style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    // decoration: BoxDecoration(
                    //   color:Colors.black.withOpacity(0.2),
                    //   borderRadius: BorderRadius.circular(20),
                    // ),

                    child: Center(
                      child: const TextField(
                        maxLines: 10,
                        minLines: 1,
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          filled: true,
                          hintText: 'Message',
                          suffixIcon: Icon(Icons.link),
                          prefixIcon: Icon(Icons.emoji_emotions),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide.none
                          ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide.none
    )

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Container(
                  
                  width:40 ,
                  height: 40,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:Colors.green.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20) ,
                  ),
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
