import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/1d0bbde3-838c-473f-aa57-9e9eff8a37fc/ddku2if-e0cefc83-5703-45cd-a16d-299699cd6f05.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvMWQwYmJkZTMtODM4Yy00NzNmLWFhNTctOWU5ZWZmOGEzN2ZjXC9kZGt1MmlmLWUwY2VmYzgzLTU3MDMtNDVjZC1hMTZkLTI5OTY5OWNkNmYwNS5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.a_FTRTuL9ViZOmn6YDFGZlQRofU0Roxt_I4ABB60UFs'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('AP'),
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar_loading.gif'),
          image: NetworkImage(
              'https://estaticos-cdn.elperiodico.com/clip/6e0e1d5f-8851-4677-b616-4cca88f99ff5_alta-libre-aspect-ratio_default_0.jpg'),
        ),
      ),
    );
  }
}
