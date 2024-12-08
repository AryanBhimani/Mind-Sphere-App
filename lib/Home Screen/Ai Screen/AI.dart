import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';
// const apiKey = "AIzaSyArTQQbRJoSlVa6D2NPHjsqpE8o2MUXM8k";
const apiKey = "AIzaSyDBlZs66H4pr9cMT2NycHKgzPZ7MulT0Ao";

// ------------------------------ Text Only ------------------------------

class textOnly extends StatefulWidget {
  const textOnly({super.key});

  @override
  State<textOnly> createState() => _textOnlyState();
}

class _textOnlyState extends State<textOnly> {
  bool loading = false;
  List textChat = [];
  List textWithImageChat = [];
  // bool _isRecording = false;


  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  // Create Gemini Instance
  final gemini = GoogleGemini(
    apiKey: apiKey,
  );

  // Text only input
  void fromText({required String query}) {
    setState(() {
      loading = true;
      textChat.add({
        "role": "User",
        "text": query,
      });
      _textController.clear();
    });
    scrollToTheEnd();

    gemini.generateFromText(query).then((value) {
      setState(() {
        loading = false;
        textChat.add({
          "role": "JARVIS AI",
          "text": value.text,
        });
      });
      scrollToTheEnd();
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
        textChat.add({
          "role": "JARVIS AI",
          "text": error.toString(),
        });
      });
      scrollToTheEnd();
    });
  }

  void scrollToTheEnd() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'AI Chat',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: textChat.length,
              padding: const EdgeInsets.only(bottom: 20),
              itemBuilder: (context, index) {
                return ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    child: Text(textChat[index]["role"].substring(0, 1)),
                  ),
                  title: Text(textChat[index]["role"]),
                  subtitle: Text(textChat[index]["text"]),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      fillColor: Colors.transparent,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                IconButton(
                  icon: loading
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.send,color: Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    fromText(query: _textController.text);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
