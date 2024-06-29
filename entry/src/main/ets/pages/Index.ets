interface Card {
  ImgUrl: string
  num: number
}


@Entry
@Component
struct Index {
  @State
  images: Card[] = [
    { ImgUrl: 'bg_00.png', num: 0 },
    { ImgUrl: 'bg_01.png', num: 0 },
    { ImgUrl: 'bg_02.png', num: 0 },
    { ImgUrl: 'bg_03.png', num: 0 },
    { ImgUrl: 'bg_04.png', num: 0 },
    { ImgUrl: 'bg_05.png', num: 0 },
  ]
  @State Opacity: number = 0
  @State ZIndex: number = 0
  @State X: number = 0 //生肖图缩放动画控制状态
  @State Y: number = 1

  build() {
    //根组件
    Column() {
      //1：初始界面
      List() {

        ForEach(this.images, (item: Card, index: number) => {
          ListItem() {
            Badge({
              value: `${item.num}`,
              style: { badgeSize: 16, badgeColor: Color.Red }
            }) {
              Image($rawfile(`${item.ImgUrl}`))
                .width(80)
            }
          }
          .padding(10)
        })

      }
      .height(300)
      .listDirection(Axis.Horizontal)
      .lanes(2)
      // .backgroundColor(Color.Pink)
      .margin({ top: 80, bottom: 50 })
      .zIndex(1)


      //立即抽卡按钮
      Button('立即抽卡')
        .width(200)
        .backgroundColor('#fff43ba3')
        .stateStyles({
          pressed: {
            .backgroundColor('#ffd40a55')
          }
        })
        .zIndex(1)
        .onClick(() => {
          this.Opacity = 1
          this.ZIndex = 2
        })


      // 2：生效抽卡界面

      Column() {
        Text('获得生肖卡')
          .fontSize(25)
          .fontColor('#F5EBCF')
          .fontWeight(600)
        Image($rawfile('img_00.png'))
          .width(200)
          .margin(30)
          .scale({ x: this.X, y: this.Y })
        Button('开心收下')
          .width(200)
          .height(50)
          .backgroundColor('rgb(0,0,0,0)')
          .border({ width: 2, color: '#F5EBCF' })
          .fontColor('#F5EBCF')
          .onClick(() => {
            this.ZIndex = 0
            this.Opacity = 0
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('rgba(0,0,0,0.8)')
      .position({})
      .zIndex(this.ZIndex)
      .justifyContent(FlexAlign.Center)
      .opacity(this.Opacity) //日常隐藏获奖显示

      // 3：抽奖界面
    }
    .width('100%')
    .height('100%')
  }
}