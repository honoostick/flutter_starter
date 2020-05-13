import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/example/data_presentation/charts.dart';
import 'package:flutter_starter/pages/example/data_presentation/list.dart'
    as mListView;
import 'package:flutter_starter/pages/example/data_presentation/table.dart';
import 'package:toast/toast.dart';

/**
 * graph, table, list
 */
class FormView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormViewState();
  }
}

class FormViewState extends State<FormView> {
  var _formKey = new GlobalKey<FormState>();
  var _userNameCtl = TextEditingController();
  var _pwdCtl = TextEditingController();
  var _infoCtl = TextEditingController();

  selectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          new PopupMenuButton<String>(
            offset: Offset(0, 100),
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              this.selectView(Icons.message, 'Action1', '1'),
              this.selectView(Icons.group_add, 'Action2', '2'),
              this.selectView(Icons.cast_connected, 'Action3', '3'),
            ],
            onSelected: (String action) {
              // 点击选项的时候
              switch (action) {
                case '1':
                  break;
                case '2':
                  break;
                case '3':
                  break;
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Form(
                key: _formKey,
                child: Container(
                  height: 230,
                    child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text('Username'),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                                height: 50,
                                child: TextFormField(
                                  controller: _userNameCtl,
                                  expands: true,
                                  maxLines: null,
                                  decoration: new InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: 'Please input username',
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    new TextFormField(
                      controller: _pwdCtl,
                      decoration: new InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      autovalidate: true,
                      validator: (val) {
                        return val.length < 4 ? "密码长度错误" : null;
                      },
                    ),
                    new TextField(
                      controller: _infoCtl,
                      autocorrect: false, // 是否自动校正
                      autofocus: false, //自动获取焦点
                      enabled: true, // 是否启用
                      inputFormatters: [], //对输入的文字进行限制和校验
                      keyboardType: TextInputType.text, //获取焦点时,启用的键盘类型
                      maxLines: 1, // 输入框最大的显示行数
                      maxLength: 20, //允许输入的字符长度/
                      maxLengthEnforced: false, //是否允许输入的字符长度超过限定的字符长度
                      obscureText: true, // 是否隐藏输入的内容
                      onChanged: (newValue) {
                        // print(newValue); // 当输入内容变更时,如何处理
                      },
                      onSubmitted: (value) {
                        // print("whar"); // 当用户确定已经完成编辑时触发
                      },
                      style: new TextStyle(color: Colors.black), // 设置字体样式
                      textAlign: TextAlign.center, //输入的内容在水平方向如何显示
                      decoration: new InputDecoration(
                          labelText: "Introduction",
                          icon: new Icon(Icons.insert_drive_file),
                          border: new OutlineInputBorder(), // 边框样式
                          helperText: 'required',
                          hintText: 'hint',
                          prefixIcon: new Icon(Icons.android),
                          prefixText: 'INFO'),
                    ),
                  ],
                )),
              ),
            ),
            MaterialButton(
              onPressed: () {
                var _form = _formKey.currentState;

                if (_form.validate()) {
                  _form.save();
                }
                Toast.show('${_userNameCtl.text}\n${_pwdCtl.text}\n${_infoCtl.text}', context);
              },
              color: Theme.of(context).primaryColor,
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
