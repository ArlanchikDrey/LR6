import 'package:architecture/notifiers/WSConnectionNotifierImpl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChangeNotifierProvider<WSConnectionNotifierImpl>(
            create: (_) => WSConnectionNotifierImpl(),
            child: PageSecondStateful()),
      ),
    );
  }
}

class PageSecondStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageSecondState();
}

class _PageSecondState extends State<PageSecondStateful> {
  final textEdit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          StreamBuilder(
              stream: context.watch<WSConnectionNotifierImpl>()?.getStream(),
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? snapshot.data : 'Empty');
              }),
          Container(
            margin: const EdgeInsets.only(top: 8, right: 20, left: 20),
            height: 100,
            child: TextField(
              keyboardType: TextInputType.multiline,
              controller: textEdit,
              style: TextStyle(
                fontSize: 16,
              ),
              maxLines: 5,
              maxLength: 50,
              textCapitalization: TextCapitalization.sentences,
              minLines: 5,
              decoration: InputDecoration(
                filled: true,
                helperText: '',
                hintText: 'Enter text',
                errorMaxLines: 3,
                hintStyle: TextStyle(
                    fontSize: 16.0, color: Colors.black.withOpacity(0.42)),
                contentPadding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 10, right: 5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 1),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            height: 44,
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                'Send',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () async {
                try {
                  context
                      .read<WSConnectionNotifierImpl>()
                      ?.sendData(textEdit.text.toString());
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textEdit.dispose();
  }
}
