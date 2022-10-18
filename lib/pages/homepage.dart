// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  List<String> _messages = ['post 1'];
  Socket socket = io('http://127.0.0.1:4200/chat');
  @override
  void initState() {
    socket.connect();
    socket.on(
      'connect',
      (_) {
        print('connected');
      },
    );
    socket.on('addPost', (data) {
      setState(() {
        _messages = [..._messages, data];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
        ),
        TextButton(
            onPressed: () {
              socket.emit('addPost', _controller.text);
            },
            child: Text('send message')),
        ListView.builder(
          itemBuilder: (context, index) {
            return Text(_messages[index]);
          },
          itemCount: _messages.length,
        )
      ],
    );
  }
}
