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

  build() {
    //根组件
    Column() {
      //1：初始界面
      List() {

        ForEach(this.images, (item: Card, index: number) => {
          ListItem() {
            Badge({
              value:`${item.num}`,
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
      .backgroundColor(Color.Pink)
      .margin({ top: 80, bottom: 50 })


      //立即抽卡按钮
      Button('立即抽卡')
        .width(200)
        .backgroundColor('#fff43ba3')
        .stateStyles({
          pressed: {
            .backgroundColor('#ffd40a55')
          }
        })


      // 2：生效抽卡界面
      Column(){

      }
      .width('100%')
      .height('100%')
      .backgroundColor('rgba(0,0,0,0.8)')
      .position({})

      // 3：抽奖界面
    }
    .width('100%')
    .height('100%')
  }
}