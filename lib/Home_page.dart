import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = new GlobalKey<FormState>();
  final formKey2 = new GlobalKey<FormState>();
  String _player_1 = '玩家1';
  int _player1Score = 0;

  String _player_2 = '玩家2';
  int _player2Score = 0;

  String _player_3 = '玩家3';
  int _player3Score = 0;

  String _player_4 = '玩家4';
  int _player4Score = 0;

  int _feeScore = 0;
  int _tmp1 = 0;
  int _tmp2 = 0;
  int _tmp3 = 0;
  int _tmp4 = 0;
  int _tmp5 = 0;
  
  @override
  Widget build(BuildContext context) {
    debugPrint(_player_1+' has score: '+_player1Score.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('麻将计分器'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(20, 40, 20, 30),
        child: SingleChildScrollView (
          child: Column(
            children: <Widget>[
              Container(
               // color: Colors.pink[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Text(_player_1, style: new TextStyle(fontSize: 20),),
                        SizedBox(height: 20,),
                        new Text(_player1Score.toString(), style: new TextStyle(fontSize: 13),),
                      ],
                    ),
                    SizedBox(width: 20,),
                    new Column(
                      children: <Widget>[
                        new Text(_player_2,style: new TextStyle(fontSize: 20),),
                        SizedBox(height: 20,),
                        new Text(_player2Score.toString(), style: new TextStyle(fontSize: 13),)
                      ],
                    ),
                    SizedBox(width: 20,),
                    new Column(
                      children: <Widget>[
                        new Text(_player_3,style: new TextStyle(fontSize: 20),),
                        SizedBox(height: 20,),
                        new Text(_player3Score.toString(), style: new TextStyle(fontSize: 13),)
                      ],
                    ),SizedBox(width: 20,),
                    new Column(
                      children: <Widget>[
                        new Text(_player_4,style: new TextStyle(fontSize: 20),),
                        SizedBox(height: 20,),
                        new Text(_player4Score.toString(), style: new TextStyle(fontSize: 13),)
                      ],
                    ),
                    SizedBox(width: 20,),
                    new Column(
                      children: <Widget>[
                        new Text('台版',style: new TextStyle(fontSize: 20),),
                        SizedBox(height: 20,),
                        new Text(_feeScore.toString(), style: new TextStyle(fontSize: 13),)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              new Container(

               // color: Colors.red[100],
                child: new Form(
                  key: formKey,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(labelText: _player_1+' 当局结算'),
                        

                        onSaved: (value) => _tmp1 += num.tryParse(value),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(labelText: _player_2+' 当局结算'),

                        onSaved: (value) => _tmp2 += num.tryParse(value),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(labelText: _player_3+' 当局结算'),

                        onSaved: (value) => _tmp3 += num.tryParse(value),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(labelText: _player_4+' 当局结算'),

                        onSaved: (value) => _tmp4 += num.tryParse(value),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(labelText: '台版 当局结算'),

                        onSaved: (value) => _tmp5 += num.tryParse(value),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new ButtonTheme(
                            child: new RaisedButton(
                              child: Text('提交', style: new TextStyle(color: Colors.white),),
                              onPressed: (){
                                final form = formKey.currentState;
                                form.save();
                                debugPrint(_tmp1.toString()+' '+_tmp2.toString()+' '+_tmp3.toString()+' '+_tmp4.toString()+' '+_tmp5.toString());
                                if(_tmp1+_tmp2+_tmp3+_tmp4+_tmp5==0){
                                  debugPrint('---------------all equal');
                                  form.reset();
                                  setState(() {
                                    _player1Score += _tmp1;
                                  _player2Score += _tmp2;
                                  _player3Score += _tmp3;
                                  _player4Score += _tmp4;
                                  _feeScore += _tmp5;
                                  _tmp1 = _tmp2 = _tmp3 = _tmp4 = _tmp5 = 0;
                                  });
                                }else{
                                  debugPrint('--------------not equal');
                                  _tmp1 = _tmp2 = _tmp3 = _tmp4 = _tmp5 = 0;
                                  form.reset();
                                  return _invalidinput();
                                  
                                }
                                
                              },
                            )
                          ),
                          SizedBox(width: 20,),
                          new ButtonTheme(
                            buttonColor: Colors.white,
                            child: new RaisedButton(
                              child: Text('改名', style: new TextStyle(color: Colors.black),),
                              onPressed: (){
                                  //_changeName();
                                  showBottomSheet(context);
                              },
                            )
                          ),
                          
                        ],
                      )
                    ],
                  ),
                )
              ),
              SizedBox(height: 15,),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                
                
                SizedBox(height: 15,),
                // new ButtonTheme(
                //   minWidth: 300,
                //             buttonColor: Colors.pink,
                //             child: new RaisedButton(
                              
                //               child: Text('结算', style: new TextStyle(color: Colors.white),),
                //               onPressed: (){
                //                //jiesuan(context);
                //                null;
                //               },
                //             )
                // ),
                // SizedBox(height: 15,),
                new ButtonTheme(
                  minWidth: 300,
                            buttonColor: Colors.pink,
                            child: new RaisedButton(
                              child: Text('Reset All Scores', style: new TextStyle(color: Colors.white)),
                              onPressed: (){
                                _reset();
                                  // setState(() {
                                  // _player1Score = _player2Score = _player3Score = _player4Score = _feeScore = 0;
                                  // _tmp1 = _tmp2 = _tmp3 = _tmp4 = _tmp5 = 0;
                                  // });
                              },
                            )
                          ),
              ],),
            ],
          ),
        ),
      ),
      
    );
  }
    void jiesuan(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            SizedBox(height: 15,),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text('结算',style: new TextStyle(fontSize: 20, color: Colors.black87),)
              ],
            ),
            SizedBox(height: 15,),
            
          ],
        );
      }
    );
  }
  void showBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            SizedBox(height: 15,),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text('修改玩家姓名',style: new TextStyle(fontSize: 20, color: Colors.black87),)
              ],
            ),
            SizedBox(height: 15,),
            new Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              //color: Colors.pink,
              child: new Form(
                      key: formKey2,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new TextFormField(
                            autocorrect: false,
                            decoration: new InputDecoration(labelText: ' 玩家1'),
                            onSaved: (value) => _player_1 = value,
                          ),
                          new TextFormField(
                            autocorrect: false,
                            decoration: new InputDecoration(labelText: ' 玩家2'),
                            onSaved: (value) => _player_2 = value,
                          ),
                          new TextFormField(
                            autocorrect: false,
                            decoration: new InputDecoration(labelText: ' 玩家3'),
                            onSaved: (value) => _player_3 = value,
                          ),
                          new TextFormField(
                            autocorrect: false,
                            decoration: new InputDecoration(labelText: ' 玩家4'),
                            onSaved: (value) => _player_4 = value,
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new ButtonTheme(
                                child: new RaisedButton(
                                  child: Text('提交', style: new TextStyle(color: Colors.white),),
                                  onPressed: (){
                                    final form = formKey2.currentState;
                                    form.save();
                                    //debugPrint(_tmp1.toString()+' '+_tmp2.toString()+' '+_tmp3.toString()+' '+_tmp4.toString()+' '+_tmp5.toString());
                                    
                                      setState(() {
                                       
                                      });
                                    
                                  },
                                )
                              ),
                             
                            ],
                          )
                        ],
                      ),
                    )
            ),
          ],
        );
      }
    );
  }
  
  Future<void> _invalidinput() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          ),
          title: Text(
            'Invalid Input',
            style: new TextStyle(color: Colors.black, fontSize: 22.0),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '当前结算不平，请确认',
                  style: new TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            
            FlatButton(
              child: Text(
                'Retry',
                style: new TextStyle(fontSize: 18.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

Future<void> _reset() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          ),
          title: Text(
            '确定要重置吗',
            style: new TextStyle(color: Colors.black, fontSize: 22.0),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '重置会失去所有已经记录的分数',
                  style: new TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                '确认',
                style: new TextStyle(fontSize: 18.0),
              ),
              onPressed: () {
                setState(() {
                                  _player1Score = _player2Score = _player3Score = _player4Score = _feeScore = 0;
                                  _tmp1 = _tmp2 = _tmp3 = _tmp4 = _tmp5 = 0;
                                  });
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                '我不要',
                style: new TextStyle(fontSize: 18.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
