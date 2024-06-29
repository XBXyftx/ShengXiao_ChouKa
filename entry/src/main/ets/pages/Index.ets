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
          Badge({
            value:'1',
            style:{badgeSize:16,badgeColor:Color.Red}
          }){
            Image($rawfile('bg_05.png'))
              .width(80)
          }
        }
        .padding(10)
      }
      .height(300)
      .listDirection(Axis.Horizontal)
      .lanes(2)
      .backgroundColor(Color.Pink)
      .margin({top:80,bottom:50})


      //立即抽卡按钮
      Button('立即抽卡')
        .width(200)
        .backgroundColor('#fff43ba3')
        .stateStyles({
          pressed:{
            .backgroundColor('#ffd40a55')
          }
        })



      // 2：生效抽卡界面
      // 3：抽奖界面
    }
    .width('100%')
    .height('100%')
  }
}