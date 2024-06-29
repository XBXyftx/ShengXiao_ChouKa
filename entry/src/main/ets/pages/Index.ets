@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    //根组件
    Column() {
      //1：初始界面
      List(){
        ListItem(){
          Text('1')
        }
      }
      .height(300)
      .backgroundColor(Color.Pink)
      .margin({top:80,bottom:50})



      // 2：生效抽卡界面
      // 3：抽奖界面
    }
    .width('100%')
    .height('100%')
  }
}