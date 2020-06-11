import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Validate"),
      ),
      body: BodyValidate(),
    );
  }
}

class BodyValidate extends StatefulWidget {
  @override
  _BodyValidateState createState() => _BodyValidateState();
}

class _BodyValidateState extends State<BodyValidate> {
  final _fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _fKey,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blueGrey[50],
                        width: 1.0
                    )
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 10
                ),
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      maxLength: 120,
                      decoration: InputDecoration(
                          hintText: "E-Mail"
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return "O campo email está vazio";
                        }else{
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Senha"
                      ),
                      maxLength: 45,
                      validator: (value){
                        if(value.isEmpty){
                          return "Campo senha vazio";
                        }else{
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Telefone"
                      ),
                      maxLength: 11,
                      validator: (value){
                        if(value.isEmpty){
                          return "Campo telefone vazio";
                        }else{
                          return null;
                        }
                      },
                    ),
                    RaisedButton(
                        child: Text("enviar"),
                        onPressed: (){
                          if(_fKey.currentState.validate()){
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("processando")));
                          }
                        }
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
