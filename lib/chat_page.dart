import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.white,),
                ),
                SizedBox(width: 2,),
                CircleAvatar(
                  // backgroundImage: NetworkImage("<https://randomuser.me/api/portraits/men/5.jpg>"),
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("OMO User",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600, color:Colors.white,),),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.green.shade600, fontSize: 13),),
                    ],
                  ),
                ),
                Icon(Icons.call,color: Colors.green.shade300,),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(children: [
            Container(height: 120, color: Colors.blue,),
            Container(height: 120, color: Colors.red,),
            Container(height: 120, color: Colors.lightBlueAccent,),
            Container(height: 120, color: Colors.green,),
            Container(height: 120, color: Colors.yellow,),
            Container(height: 120, color: Colors.blue,),
            Container(height: 120, color: Colors.orange,),
            Container(height: 120, color: Colors.yellowAccent,),
            Container(height: 120, color: Colors.black,),
          ]),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Message...",
                        hintStyle: TextStyle(color: Colors.white),
                        suffixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.attach_file,  color: Colors.amberAccent),),
                          IconButton(onPressed: (){}, icon: Icon(Icons.mic,  color: Colors.amberAccent),)
                        ],),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.send, color: Colors.amberAccent),)
                ],
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
