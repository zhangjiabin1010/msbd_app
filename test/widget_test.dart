return Scaffold(
        appBar: AppBar(title: Text("选择学习技能"), centerTitle: true),
        body: Column(
          children: [
            ExpansionTile(
                title: Text('语言'),
                leading: Icon(Icons.ac_unit, color: Colors.green),
                backgroundColor: Colors.white,
                initiallyExpanded: true, // 是否默认展开
                children: <Widget>[
                  ListTile(
                      title: Text('Java'),
                      trailing: IconButton(
                          icon: Icon(Icons.star),
                          onPressed: () {
                            print('secondAction');
                          })),
                  ListTile(title: Text('Python')),
                  ListTile(title: Text('Go')),
                  ListTile(title: Text('JavaScript')),
                ]),
            ExpansionTile(
                title: Text('基础'),
                leading: Icon(Icons.ac_unit, color: Colors.green),
                backgroundColor: Colors.white,
                initiallyExpanded: true, // 是否默认展开
                children: <Widget>[
                  ListTile(title: Text('算法')),
                  ListTile(title: Text('网络')),
                  ListTile(title: Text('架构设计')),
                ])
          ],
        ));
  }