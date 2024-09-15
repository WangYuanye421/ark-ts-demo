// 定义数据结构
class BannerClass{
  id: string = '';
  imageSrc: ResourceStr = '';
  url: string = '';

  constructor(id: string, imageSrc: ResourceStr, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}

/**
 * todo
 * 图片替换
 * 后端接口
 *
 */

// 首页： 风格确定
@Entry
@Component
struct Index {
  @State message: string = '选择风格';
  build() {
    RelativeContainer(){
      Column({ space: 10 }) { // Column组件间距
        // 上半部
        Column({ space: 10 }){
          Text(this.message)
            .fontSize(24)
            .fontWeight(700)
            .width('100%')
            .textAlign(TextAlign.Start)
              //.padding({left:16})
            .fontFamily('HarmonyHeiTi-Bold')
            .lineHeight(33)

          Column(){
            Banner()
              .width('100%')
              .height('100%')
          }
          .height('85%')
          .borderRadius(16)
          .backgroundColor('#ff8cef35')
        }
        .height('40%')
        //.backgroundColor('#ff8cef35')

        // 下半部
        Column({space: 10}){
          Row(){
            Text('随机种子')
              .fontSize(18)
              .fontWeight(70)
              .width('30%')
            TextInput({placeholder: '你好，输入'})
              .border({color:'#ff191f1e'})
              .width('50%')
            Button('确定')
              .borderRadius(16)
          }
          .width('80%')
          //.backgroundColor('#ff74f3e0')

          StyleTable()
        }
      }
      //.backgroundColor('#ff197de0')
    }

  }
}

//@Preview // 使用preview装饰器修饰，可以被预览
@Component
struct Banner{
  @State bannerList: Array<BannerClass> = [
    new BannerClass('pic0', $r('app.media.demo'), ''),
    new BannerClass('pic1', $r('app.media.demo'), ''),
    new BannerClass('pic2', $r('app.media.demo'), ''),
    new BannerClass('pic3', $r('app.media.demo'), ''),
    new BannerClass('pic4', $r('app.media.demo'), ''),
    new BannerClass('pic5', $r('app.media.demo'), ''),
  ]

  build() {
    Swiper(){
      ForEach(this.bannerList, (item: BannerClass, index: number) => {
        Image(item.imageSrc)
          .objectFit(ImageFit.Contain)
          .width('50%')
          .height('50%')
          .margin({top:'20%', bottom:'25%', left: '25%', right: '25%'})
          .borderRadius(16)
          .border({color: Color.Black, width:2})
      },(item: BannerClass, index: number) => item.id)
    }
    .autoPlay(false)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7')
    )
    .onChange( e => {
      // todo 延时加载 只获取前3个风格， 2-》4， 3-》5， 4-》6， 5-》7
      console.log("滑动了头像");
    })
  }
}


//@Preview
@Component
struct StyleTable{
  data2: number[] = [0, 1, 2, 3, 4, 5]

  build() {
    Grid() {
      ForEach(this.data2, (item: number) => {
        // GridItem和Column不设置高度，默认会自适应子组件大小，设置STRETCH的场景下，会变成与当前行最高节点同高。
        // 若设置高度，则会保持已设置的高度，不会与当前行最高节点同高。
        GridItem() {
          Text('N' + item).height(80)
        }
        .backgroundColor(Color.Orange)
        .border({ color: Color.Black, width: 1 })
      })
    }
    .columnsGap(10)
    .rowsGap(5)
    .columnsTemplate('1fr 1fr')
    .width('100%')
    .height('100%')
    // Grid设置alignItems为STRETCH，以当前行最高的GridItem的高度为其他GridItem的高度。
    .alignItems(GridItemAlignment.STRETCH)
    .scrollBar(BarState.Off)
  }
}

