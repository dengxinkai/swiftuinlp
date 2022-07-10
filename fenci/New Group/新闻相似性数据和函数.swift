//
//  新闻相似性数据和函数.swift
//  fenci
//
//  Created by dengxinkaiacca@163.com on 7/1/22.
//

import Foundation
import NaturalLanguage
import TabularData

class 新闻数据: ObservableObject {
    @Published var 显示字典: String = ""
    @Published var 显示字典1: Double = 0
    @Published var 一篇新闻中的句子 :[String]=[]
    @Published var texts :[String]=[]
    var 文本距离 :Double=1
    var distance = 1.0
    @Published var 相似文本 :String = ""
    var 停用词=["为","于","月","2022","期","安","盾","年度","年初","元","亿","较","银行","经济","在","的","了","和","小","是","年","公司","金融","市场","中国"]
    @Published var text2 = """
    时间回到1949年10月20日，人们还沉浸在欢庆新中国成立的喜悦中，天安门广场西南侧西交民巷108号院内，也是一派热闹景象。为迅速发展经济，经中央人民政府批准，中国人保在这一天正式挂牌成立。
    """
    func tokenizeText(text: String,shuru: String) {
        显示字典 = ""
        显示字典1 = 0
            let tokenizer = NLTokenizer(unit: .sentence)
            tokenizer.setLanguage(.simplifiedChinese)
            tokenizer.string = text
            
            tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
                一篇新闻中的句子.append(String(text[tokenRange]))
                return true}
        for ixx in 一篇新闻中的句子
            {if let sentenceEmbedding = NLEmbedding.sentenceEmbedding(for: .english) {
                   let sentence = ixx
                   distance =
                sentenceEmbedding.distance(between: sentence, and:shuru)
                if 文本距离 > distance{
                    文本距离 = distance
                    相似文本 = ixx}}}
            显示字典 = 相似文本
        显示字典1 = 文本距离
            文本距离 = 1
            相似文本 = ""
            distance = 1
            一篇新闻中的句子 = []
        
        }
    func fenci(texts: String) -> String {
        var result = ""
        let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
        let range = NSRange(location: 0, length: texts.utf16.count)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.string = texts.lowercased()
        tagger.enumerateTags(in: range, unit: .word, scheme: .tokenType, options: options) { tag, tokenRange, _ in
            let word = (texts as NSString).substring(with: tokenRange)
            result = result+"--"+word}
        return result
    }
    func 获取高频词(text: String) -> [String: Double] {
            let url = Bundle.main.url(forResource: "baidu_stopwords", withExtension: "csv")!
            let result = try? DataFrame(contentsOfCSVFile: url,options: CSVReadingOptions(
                hasHeaderRow: true))

         let  停用词1 = Array(result!["停用词", String.self])
            
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
            if 停用词1.contains(key){
                bagOfWords[key]=nil
            }
        }
        for key in bagOfWords.keys{
            if key.utf16.count == 1 {
                bagOfWords[key]=nil
            }
        }
//        判断字符串是不是数字
        for key in bagOfWords.keys{
            if key.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil {
                bagOfWords[key]=nil
            }
        }
        return bagOfWords
    }
    }


