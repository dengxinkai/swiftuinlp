//
//  hle.swift
//  fenci
//
//  Created by dengxinkaiacca@163.com on 6/26/22.
//

import SwiftUI
import NaturalLanguage

struct SwiftUIView: View {
    @State var sliderValue: Double = 7
    @State var 输入文本: String = "金融是经济的血脉，货币是金融的根基。回望过去十年，我国国内生产总值（GDP）由2012年的51.9万亿元增长至2021年的114.4万亿元，这背后离不开金融与实体经济的良性循环，尤其是金融宏观调控精准有力的支持。2012年以来，广义货币供应量（M2）年均增速10.8%，与名义GDP年均增速基本匹配，有力地推动了国民经济稳健发展。正如中国人民银行副行长陈雨露在中共中央宣传部举行的“中国这十年”系列主题新闻发布会上介绍党的十八大以来金融领域改革与发展情况时所言，“这十年，我们稳健实施以我为主的货币政策，综合研判复杂多变的国内外经济金融形势，发挥好货币政策总量调节和结构调节的双重功能，前瞻性地加强跨周期的调节，有效应对世纪疫情等内外部的冲击。在这个过程当中，有力地促进稳增长、稳物价、稳就业和国际收支平衡。我们坚持管住货币总闸门，不搞‘大水漫灌’，守护好老百姓的钱袋子。”十年来，货币政策工具体系不断丰富，货币供应调控机制更加完善。肩负调节货币“总闸门”的责任和使命，人民银行完善跨周期设计和调节，大胆创新货币政策工具，根据经济金融形势变化，科学把握货币政策力度和精度，将金融资源引流至国民经济发展中的重点领域和薄弱环节。除了总量工具，结构性货币政策持续发力是近年来金融宏观调控的一大亮点。为了引导更多金融资源流向小微企业，人民银行构建“三档两优”的存款准备金政策新框架，2018年以来，先后多次全面降准或定向降准，引导金融机构将释放资金用于发放小微企业贷款。2020年，新冠肺炎疫情对小微企业造成巨大冲击，人民银行推出了两项直达工具。在一系列政策推动下，小微企业融资难、融资贵已经有了明显改善。截至今年4月末，全国小微企业贷款余额38.8万亿元，是2012年末的3.35倍。除此之外，人民银行还推出碳减排支持工具、科技创新再贷款等结构性货币政策工具。这些工具兼具总量调节和结构性调节双重功能，在不搞“大水漫灌”的同时，发挥了“精准滴灌”、定向调控的作用。"
    var body: some View {
        NavigationView {
            VStack{
                GeometryReader { geometry in
                            ScrollView {
                                Text(输入文本)
                                    .lineLimit(nil)
                                    .frame(width: geometry.size.width)
                            }}
                Spacer()
                NavigationLink(destination: hle(绑定输入文本: $输入文本)) {
                    Text("统计高频词").font(.title)
                }
            }}}}
struct hle : View {
    @Binding var 绑定输入文本: String
    var body: some View {
        let bagOfWords = bow(text: 绑定输入文本)
        let 筛选后字典 = bagOfWords.sorted{$0.1 > $1.1}.filter { $0.1 > 0}
        let keys = 筛选后字典.map{$0.key}
        let values = 筛选后字典.map {$0.value}
        ScrollView{
            ForEach(keys.indices) {index in
                HStack {
                    Text(keys[index])
                    Text("\(values[index],specifier: "%.0f")")
                  
                }}}}}
extension hle {
    func bow(text: String) -> [String: Double] {
        let 停用词=["的","了","和","小","是","年"]
        var bagOfWords = [String: Double]()
        let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
        let range = NSRange(location: 0, length: text.utf16.count)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.string = text.lowercased()
        tagger.enumerateTags(in: range, unit: .word, scheme: .tokenType, options: options) { _, tokenRange, _ in
            let word = (text as NSString).substring(with: tokenRange)
            if bagOfWords[word] != nil {
                bagOfWords[word]! += 1
            } else {
                bagOfWords[word] = 1
            }}
        for key in bagOfWords.keys{
            if 停用词.contains(key){
                bagOfWords[key]=nil
            }
        }
        return bagOfWords
    }}
struct hle_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

