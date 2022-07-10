//
//  111.swift
//  fenci
//
//  Created by dengxinkaiacca@163.com on 6/28/22.
//
import NaturalLanguage
import CoreML
import SwiftUI


struct _11: View {
    @State var 输入文本="明新旭腾关于使用银行承兑汇票、信用证等票据支付募投项目现金并以募集资金等额置换的公告"
    @State var 识别结果=""
    var body: some View {
        VStack{Text(输入文本).padding()
                .foregroundColor(Color.white)
                .background(Color.gray)
                .font(.title)
            Button("识别") {
                识别结果=""
                getJoke()
            }
            Text(识别结果).font(.title)
        }}
    func getJoke() {
        do {
            let mlModel = try AppleTagger(configuration: MLModelConfiguration()).model
            let customModel = try NLModel(mlModel: mlModel)
            let customTagScheme = NLTagScheme("Apple")
            let tagger = NLTagger(tagSchemes: [.nameType, customTagScheme])
            tagger.string = 输入文本
            tagger.setModels([customModel], forTagScheme: customTagScheme)
            tagger.enumerateTags(in: 输入文本.startIndex..<输入文本.endIndex, unit: .word,scheme: customTagScheme, options: .omitWhitespace) { tag, tokenRange  in
                if tag!.rawValue != "NONE" {
                    识别结果+="\(输入文本[tokenRange]): \(tag!.rawValue)\n"
                }
                return true
            }
        } catch {
            print(error)
        }
    }
}

struct _11_Previews: PreviewProvider {
    static var previews: some View {
        _11()
    }
}
