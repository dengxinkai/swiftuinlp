//
//  ceshi.swift
//  fenci
//
//  Created by dengxinkaiacca@163.com on 6/29/22.
//
import SwiftUI
import NaturalLanguage
import CoreML
struct wve: View {
    @AppStorage("tapCount") private var tapCount = 0
    @AppStorage("输入") private var shuru = "国资和互联网产业资本大佬都用钱投票，就可以知道这是一家什么样级别的公司了，恶意中伤的言论就不用去理会了。新浪财经报道，市值风云完成亿元级B轮融资 深圳国资、洛克资本、小米等入股"
    @AppStorage("新闻") private var texts =
        """
        当然了，宝丰能源是很优秀的企业，不过在中国做氢能源，而且要做到未来10年比如30%的市场占有率，我说3个我觉得有可能的公司，中国石化(SH600028)中国神华(SH601088)宝钢股份(SH600019)，3家企业占有氢能源的几项壁垒（不是一一对应的），渠道、氢元素来源和市场//@郭荆璞:我不这么看，不过我理解你的看法了

        """
    var container = AttributeContainer()
    let 新闻: [String] = ["""
              每经AI快讯，开源证券08月10日发布研报称，维持九典制药（300705.SZ，最新价：28.66元）买入评级。评级理由主要包括：1）业绩符合预期，公司业绩有望持续快速增长；2）洛索洛芬钠凝胶膏放量迅速，持续受益于透皮给药贴剂市场扩容；3）公司整体毛利率持续提升，辅料快速增长，原料药品种储备不断丰富。风险提示：竞品上市速度超预期；主力品种被纳入全国集采或地方带量采购。AI点评：九典制药近一个月获得1份券商研报关注。每经头条（nbdtoutiao）——楼市调控1个月66次！购房者开始动摇：有人放弃假离婚，有人庆幸没接学区房(记者蔡鼎)免责声明：本文内容与数据仅供参考，不构成投资建议，使用前核实。据此操作，风险自担。
    """,
    """
天然气、矿产价格纷纷飙升
国际能源价格在2021年出现了剧烈的上涨。
其中涨幅最大的莫过于天然气价格。荷兰产权转让设施天然气价格指数（简称TTF）在2021年的增长超过400%，2021年平均价格为16美元/百万英热。
油价则上涨了70%，截至2021年底，布伦特原油的价格约为70美元/桶。
钴和碳酸锂的涨幅相似，2021年二者的平均价格分别为5.1万美元/吨、1.1万美元/吨。
在2022年的前五个月，碳酸锂的价格已经飙升超过400%，达到5.4万美元/吨的价格水平。


石油需求有所下降
2021年石油的平均需求比2019年低3.7百万桶/天。
这种疲软的现象主要集中于和航空领域相关的石油需求上，此类需求相对2019年下降超过2.5百万桶/天，下降幅度超过33%。
2021年，柴油和汽油的需求相较于大流行前的水平下降了1百万桶/天，下降幅度3%。相比之下石脑油与其他石油产品的需求则比疫情前的水平要高。


“风光”依旧强势
源于强劲的太阳能以及风能的扩张趋势，可再生能源（不含水力）在全球发电中的份额呈现上升的势态。
2021年光伏与风力发电装机容量继续保持增长，增幅为226GW，接近2020年创下的236GW的记录。
中国是光伏与风能装机量增长的主要贡献者，分别占全球新装机增量的36%与40%。
说起光伏，风云君可就不困了，这肯定是市值风云覆盖较全面的一个行业，你能想象到的相关公司在APP内几乎都能找到，为你带来行业上中下游一条龙的知识提供服务。
（来源：市值风云APP）
2021年，可再生能源在发电中的份额占到了13%，高于核能9.8%的占比。煤炭在行业中的份额则从35%小幅度上升至36%，但是仍然低于2019年的水平。
2021年，天然气发电的份额为23%，接近自己十年前的水平。


石油、天然气和煤炭贸易
2021年，从俄罗斯进口的天然气约占欧盟天然气总消费量的40%，石油占25%，煤占20%。

2021年，阿尔及利亚通过管道对欧洲的天然气出口量是该地区管道供应增长的最大来源，增加了130亿立方米。其次是阿塞拜疆，增长了60亿立方米。2021年俄罗斯通过管道向欧洲的供应量稳定在1670亿立方米，对欧盟出口下降了120亿立方米（-8.2%）。
这也不免令人联想到当今的俄乌冲突，作为天然气出口大国的俄罗斯，其一举一动都会对当今的能源市场产生无法忽视的影响。
对当今最热的话题，风云君同样进行了覆盖，欢迎有兴趣的小伙伴移步至此
""",
    """
    今天沃森生物的电话会议透露，沃森生物HPV2预计是签批发700万、销售目标是500万。如果销售目标达成，则意味着能够带来16.5亿的营收。

    1）2021年沃森生物营收是34.6亿，其中13价销售27亿、增长60%以上。
    今年13价国内销售会继续增加、13价新增200万支摩-洛哥出口，在两种增长点的加持下，我们认为13价能够实现在原有基础上增长50%的销售收入：27X1.5=40.5亿
    此外，传统业务去年7.6亿，今年受到了影响，但是我们认为至少5亿营收应该是有的；
    那么对应的业绩就是：40.5+16.5+5=62亿左右，按照27%的净利润率大约为16.75亿（这个利润是扣除了非经常性损益和新冠研发费用后，利润率13价大概是30%、2价HPV大约为20%，由于13价销售收入占比2/3，2价1/3，所以整体利润率大概在27%左右）
    2）之前我们判断，沃森的营收至少能够在2021年的基础上增长50%，34.6X1.5=52亿左右；主要判断依据：13价国内销售继续放量、13价200万支出口摩洛哥（2021年13价销售470万支）、HPV2上市放量、传统疫苗恢复性增长。
    假设原有业务不增长、只有HPV2完成500万支销售目标，那么2022年的业绩至少有34.6+16.5亿=51.1亿营收，增速也基本能够达到50%。
    所以，我们认为沃森的2022年业绩至少会是52亿营收，中性预期应该是60亿以上，对应真实净利润16.75亿、赋予60倍估值，大约为1005亿市值、对应股价62.5。
    4）2023年业绩预判：营收有望突破100亿
    预计2023年，13价和HPV2价有望实现双千万销售目标（其中2022年13价销售加上出口会超过800万支、2价HPV达到500万支），营收有望达到55+33=88亿，外加传统业务恢复性增长（23价恢复性增长、4价流脑PQ贡献业绩），整体营收有望达到100亿左右，按照25%的净利润率计算，则意味着25亿净利润，赋予60倍估值，大约为1500亿市值、对应股价93.5左右。
"""]
    @ObservedObject var news: 新闻数据
    @ObservedObject var labelnews: 标注数据
    @State var attext :AttributedString = ""
    @State var keys = [String]()
    @State var values = [Double]()
    @State var 识别结果=""
    @State var 投资投机判定结果=""
    @State var 输入的投资投机判定结果="22"
    @State var jieguo=""
    @AppStorage("yulu") private var 语录 = "永远不要问理发师你是否需要理发。"
    var body: some View {
        VStack{HStack{VStack{  Menu("Editing") {
            Button("Set In Point", action: mlacc)
            Button("Set Out Point", action: mlacc)
        }
            Divider().frame().frame(width:100)
            
            ScrollView{
                Text(投资投机判定结果+"新闻").font(.largeTitle).bold()
                
                    .foregroundColor(投资投机判定结果=="投机" ?.red :.blue)
                    .underline()
                    .frame(width:100)
                    .onAppear(perform: {
                        投资投机判定结果 = touzitouji(text:texts)
                    })}
            Text("\(tapCount)")
            Text("关键词").font(.headline)
            Divider().frame().frame(width:100)
            List{ForEach(keys.indices,id:\.self) {index in
                VStack {
                    Text(keys[index])
                    Text("\(values[index],specifier: "%.0f")")
                }}}.frame(width:100,height:300)
                .onAppear(perform: {let bagOfWords = news.获取高频词(text: texts)
                    let 筛选后字典 = bagOfWords.sorted{ $0.1 > $1.1 }.filter { $0.1 > 5 }
                    keys = 筛选后字典.map{$0.key}
                    values = 筛选后字典.map {$0.value}
                })}
            let attext: AttributedString = {
                do {
                    var attributeContainer = AttributeContainer()
                    attributeContainer.baselineOffset = 4
                    attributeContainer.kern = 3
                    attributeContainer.underlineColor = .blue
                    
                    attributeContainer.underlineColor = .cyan
                    attributeContainer.underlineStyle = .patternDashDotDot
                    var text = try AttributedString(markdown: texts)
                    
                    for lie in labelnews.黄色列表 {
                        if let range = text.range(of: lie,options: .regularExpression) {
                            text.characters.replaceSubrange(range, with: lie+"（资产）")
                            text[range].backgroundColor = .yellow
                            
                            text[range].font = .footnote
                            text[range].mergeAttributes(attributeContainer)
                        }
                    }
                    for lie in labelnews.红色列表 {
                        if let range = text.range(of: lie,options: .regularExpression) {
                            text[range].backgroundColor = .red
                            text[range].foregroundColor = .yellow
                            text[range].font = .title2
                            
                        }
                    }
                    for lie in labelnews.紫色列表 {
                        if let range = text.range(of: lie,options: [.regularExpression,.backwards]) {
                            text[range].backgroundColor = .purple
                            text[range].foregroundColor = .yellow
                            text[range].font = .footnote
                            text[range].mergeAttributes(attributeContainer)
                        }
                    }
                    for lie in labelnews.绿色列表 {
                        if let range = text.range(of: lie) {
                            text[range].backgroundColor = .cyan
                            text[range].foregroundColor = .red
                            text[range].font = .footnote
                            //                                text[range].font = UIFont.boldSystemFont(ofSize: 15)
                            text.characters.replaceSubrange(range, with: lie+"（企业的根本）")
                        }
                    }
                    return text
                } catch {
                    return ""}}()
            
            VStack{Text("新闻").font(.headline)
                Divider()
                ScrollView{
                    Text(attext).onTapGesture(count: 1) {
                        tapCount += 1
                        texts = 新闻.randomElement()!
                        投资投机判定结果 = touzitouji(text: texts)
                        let bagOfWords = news.获取高频词(text: texts)
                        let 筛选后字典 = bagOfWords.sorted{ $0.1 > $1.1 }.filter { $0.1 > 1 }
                        keys = 筛选后字典.map{$0.key}
                        values = 筛选后字典.map {$0.value}
                    }
                }.padding(EdgeInsets(top: 2, leading: 5, bottom: 5, trailing: 5))}
        }
            ScrollView{
                Text(语录+"\n--巴菲特").multilineTextAlignment(.trailing).onTapGesture(count: 1) {
    
                    语录 = labelnews.巴菲特语录.randomElement()!
                    
                }}
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 5, trailing: 15)).foregroundColor(.blue)
            .font(.subheadline)
            .frame(width:390,height:70)
            .background(.yellow)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 5)
            )
            HStack{
              
                            TextEditor(text: $shuru)
                    .frame(height:50)
                    
                  
                Button{
                    输入的投资投机判定结果=touzitouji(text:shuru)
                    news.tokenizeText(text: texts, shuru: shuru)
                }
            label: {
                Label("新闻相似投机判定", systemImage: shuru.isEmpty ? "doc.richtext.zh" : "doc.richtext.fill.zh")
            }.frame(width:110)
            }
            Text(输入的投资投机判定结果).onAppear(perform: {
                输入的投资投机判定结果 = touzitouji(text:shuru)
            })
            ScrollView{
                Text(news.显示字典).multilineTextAlignment(.leading).frame(width:350)
                    
              
            }.frame(height:50)  }}
    func touzitouji(text:String) -> String {
        do {
            jieguo = ""
        let mlModel = try touzitouji_1(configuration: MLModelConfiguration()).model
        let sentimentPredictor = try NLModel(mlModel: mlModel)
           jieguo = sentimentPredictor.predictedLabel(for: text)!
        }
     catch {
        print(error)
    }
    return jieguo }
    func mlacc() {
        do {
            识别结果=""
            let mlModel = try AppleTagger(configuration: MLModelConfiguration()).model
            let customModel = try NLModel(mlModel: mlModel)
            let customTagScheme = NLTagScheme("Apple")
            let tagger = NLTagger(tagSchemes: [.nameType, customTagScheme])
            tagger.string = texts
            tagger.setModels([customModel], forTagScheme: customTagScheme)
            tagger.enumerateTags(in: texts.startIndex..<texts.endIndex, unit: .word,scheme: customTagScheme, options: .omitWhitespace) { tag, tokenRange  in
                if tag!.rawValue != "NONE" {
                    识别结果+="\(texts[tokenRange]): \(tag!.rawValue)\n"
                }
                return true
            }
        } catch {
            print(error)
        }
    }
    
}

struct ceshiPreviews: PreviewProvider {
    static var previews: some View {
        wve(news: 新闻数据(),labelnews: 标注数据())
    }
}



