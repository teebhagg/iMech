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
          backgroundColor: Colors.grey,
          elevation: 0,
          toolbarHeight: 100,
          title: const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('img/car1.jpg'),
          ),
          actions: const [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.call,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.grey.shade200,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    children: [
                      const Expanded(
                          child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'Message',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                            border: InputBorder.none),
                      )),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
