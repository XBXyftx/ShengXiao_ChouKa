interface Card {
  ImgUrl: string
  num: number
}


@Entry
@Component
struct Index {
  @State
  images: Card[] = [
    { ImgUrl: 'bg_00.png', num: 0 }, //0
    { ImgUrl: 'bg_01.png', num: 0 }, //1
    { ImgUrl: 'bg_02.png', num: 0 }, //2
    { ImgUrl: 'bg_03.png', num: 0 }, //3
    { ImgUrl: 'bg_04.png', num: 0 }, //4
    { ImgUrl: 'bg_05.png', num: 0 },//5
  ]
  @State Opacity: number = 0
  @State ZIndex: number = 0
  @State ZIndex2: number = 0
  @State X: number = 0 //生肖图缩放动画控制状态
  @State Y: number = 0
  @State randomNum: number = 8
  @State zhongJiang: boolean = false
  @State jiangpin: string = ''

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
          this.X = 1
          this.Y = 1
          this.randomNum = Math.floor(Math.random() * 6)


        })


      // 2：生肖抽卡界面
      Column() {

        Text('获得生肖卡')
          .fontSize(25)
          .fontColor('#F5EBCF')
          .fontWeight(600)

        Image($rawfile(`img_0${this.randomNum}.png`))
          .width(200)
          .margin(30)
          .scale({ x: this.X, y: this.Y })
          .animation({
            duration: 1000
          })

        Button('开心收下')
          .width(200)
          .height(50)
          .backgroundColor('rgb(0,0,0,0)')
          .border({ width: 2, color: '#F5EBCF' })
          .fontColor('#F5EBCF')
          .onClick(() => {
            this.ZIndex = 0
            this.ZIndex2 = 0
            this.Opacity = 0
            this.X = 0
            this.Y = 0
            this.images[this.randomNum] = {
              ImgUrl: `img_0${this.randomNum}.png`,
              num: ++this.images[this.randomNum].num
            }
            let count: number = 0
            for (let item of this.images) {
              if (item.num >= 1) {
                ++count
              } else {
                break
              }
            }
            if (count == 6) {
              this.zhongJiang = true
              const arr: string[] = ['hw.png', 'pg.png']
              let jiangpin: number = Math.floor(Math.random() * 2)
              this.jiangpin = arr[jiangpin]
              this.ZIndex2 = 3
            } else {
              this.ZIndex2 = 0
              this.ZIndex = 2
            }
          })
          .animation({
            duration: 0
          })

      }
      .width('100%')
      .height('100%')
      .backgroundColor('rgba(0,0,0,0.8)')
      .position({x:0,y:0})
      .zIndex(this.ZIndex)
      .justifyContent(FlexAlign.Center)
      .opacity(this.Opacity) //日常隐藏获奖显示


      //遮盖层条件渲染
      if (this.zhongJiang) {
        // 3：抽奖界面
        // 抽奖⻚⾯-遮罩层
        //中奖才显示
        Column({ space: 50 }) {
          Text('恭喜获得手机一部')
            .fontColor('#F5EBCF')
            .fontSize(25)
            .fontWeight(600)
          Image($rawfile(this.jiangpin))
            .width(300)
          Button('再来一次')
            .width(200)
            .height(50)
            .backgroundColor(Color.Transparent)
            .border({ width: 2, color: '#FFF9E0' })
            .onClick(() => {
              this.zhongJiang = false
              this.images = [
                { ImgUrl: 'bg_00.png', num: 0 },
                { ImgUrl: 'bg_01.png', num: 0 },
                { ImgUrl: 'bg_02.png', num: 0 },
                { ImgUrl: 'bg_03.png', num: 0 },
                { ImgUrl: 'bg_04.png', num: 0 },
                { ImgUrl: 'bg_05.png', num: 0 },
              ]
              this.ZIndex2 = 0
              this.ZIndex = 0
            })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.8)')
        .justifyContent(FlexAlign.Center)
        .position({})
        .zIndex(this.ZIndex2)
      }


    }
    .width('100%')
    .height('100%')
  }
}