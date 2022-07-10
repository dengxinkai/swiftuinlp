//
//  颜色字体数据模型.swift
//  fenci
//
//  Created by dengxinkaiacca@163.com on 7/1/22.
//

import SwiftUI
import Foundation
import NaturalLanguage
class 标注数据: ObservableObject {
    @Published var 黄色列表 = ["营业收入","长期股权投资","商誉","保险","货币性资产"]
    @Published var 红色列表 = [#"《\w+?》"#,#"[，。][^，。]*议案[^，。]*[，。]"#,#"[，。][^，。]*收入增长[^，。]*[，。]"#,#"[，。][^，。]*红利[^，。]*[，。]"#,#"[，。][^，。]*销售为[^，。]*[，。]"#,"商誉","保险","货币性资产"]
    @Published var 紫色列表 = [#"[，。][^，。]*毛利率为[^，。]*[，。]"#,#"[，。][^，。]*审议了[^，。]*[，。]"#,#"[，。][^，。]*6个月内[^，。]*[，。]"#,#"[，。][^，。]*审议通过[^，。]*[，。]"#,#"[，。][^，。]*不会影响[^，。]*[，。]"#,#"[，。][^，。]*意见[^，。]*[，。]"#,#"[，。][^，。]*变更[^，。]*[，。]"#,"减值","费用",#".{6}变脸"#,#"[，。][^，。]*\d{1,4}[^，。]*[，。]"#,#"[，。][^，。]*控制[^，。]*[，。]"#,#"[，。][^，。]*收入[^，。]*[，。]"#]
    @Published var 绿色列表 = ["销售","增长","销售收入"]
    @Published var attext = AttributedString("补充披露 CBCH II2021 年财务报表，列示上表各项目 2021 年实际实现的营业收入， 并说明与预测数据的差异及差异产生的原因(如适用);(3)补充披露报告期对 CBCH II、CBCH V 长期股权投资减值测试采用的重要评估参数 及评估结果的推算过程，包括但不限于预期各年度现金流量、折现率等，并说明上述评估参 数、评估依据的确定理由;(4)对比报告期对 CBCH II、CBCH V 长期股权投资减值测试和 2020 年期末对 CBCH II 股东全部权益减值测试的过程和结果，说明重组标的资产 2020 年期末评估增值而 2021年期末即大额减值的原因及合理性，是否存在延迟计提大额减值从而使得控股股东蓝帆投资逃废重组补偿义务的情结合上述商誉所在资产组未来收入、成本、费用的预测数据，说明预测期、预测期增长率、稳定期增长率、利润率、折现率等商誉减值测试关键参数的确定依据，说明报告 期计提.98亿元商誉减值的测算过程及其合规性(6)说明报告期商誉减值测试采用的预测数据和关键参数与上年度商誉减值测试时存在的差异及其合理性，你公司所称报告期出现的减值迹象在上年度是否业已存在或可以预见， 进一步说明 2020年度商誉减值计提是否充分、合理，是否存在利用商誉减值计提跨期调节 利润的(7)说明你公司重组收购标的业绩承诺期后大幅“业绩变脸”的原因及合理性，并说明标的资产业绩承诺期内的业绩真实性、重组收购时相关预测的准确性以及交易作价的公允 性;通过 FDA 的现场检查。站在 2020 年年底的时间点，公司预测海外疫情在 2021 年会逐渐得 到控制，人民生活会慢慢恢复正常，FDA 现场检查完成后即可拿证并在 2021 年上市销售， 结合美国市场规模、价格、公司 BioFreedom 支架的独特适应症以及首年销售的供应商备货， 公司 2020 年底预测 BioFreedom 支架 2021 年在美国市场可以销售 2,000 万美元。2021 年由于海外疫情反复持续影响 FDA 正常开展验厂等工作，公司取得美国 FDA 注册 证的时间一再延迟，在本公司申请注册证期间，有 2 家美国本土医疗器械巨头的同类产品先 后取得 FDA 针对高出血风险患者的批准，导致 BioFreedom 即使最终取得 FDA 注册证，也已 经丧失了其在美国高出血风险患者群体中的先发优势，BioFreedom 在激烈竞争的美国市场 难以取得过去所期望的市场份额。美国 FDA 由于疫情的影响，迟迟未能到公司位于新加坡的 工厂进行现场检查，公司从而未能在 2021 年如期取得注册证，因此自然未能实现 2020 年预 测的 2021 年度销售收入。上述海外疫情在 2021 年反复发生的事项以及因海外疫情制约 FDA 验厂导致未能如期取得美国 FDA 注册证事项均属于 2020 年底无法预见的事项，因此导致了 实际销售和预测的差异。")
    @Published var 巴菲特语录: [String] = ["一生能够积累多少财富，不取决于你能够赚多少钱，而取决于你如何投资理财，钱找人胜过人找钱，要懂得钱为你工作，而不是你为钱工作。",
                         "那些最好的买卖，刚开始的时候，从数字上看，几乎都会告诉你不要买。",
                         "我们之所以取得目前的成就，是因为我们关心的是寻找那些我们可以跨越的一英尺障碍，而不是去拥有什么能飞越七英尺的能力。",
                         "在别人恐惧时我贪婪，在别人贪婪时我恐惧。",
                         "如果你不愿意拥有一只股票十年，那就不要考虑拥有它十分钟。",
                         "拥有一只股票，期待它下个早晨就上涨是十分愚蠢的。",
                         "永远不要问理发师你是否需要理发。",
                         "任何不能永远发展的事物，终将消亡。",
                         "投资并非一个智商为160的人就一定能击败智商为130的人的游戏。",
                         "市场就像上帝一样，帮助那些自己帮助自己的人，但与上帝不一样的地方是，他不会原谅那些不知道自己在做什么的人。",
                         "就算美联储主席格林斯潘偷偷告诉我他未来二年的货币政策，我也不会改变我的任何一个作为。",
                         "我只做我完全明白的事。",
                         "不同的人理解不同的行业。最重要的事情是知道你自己理解哪些行业，以及什么时候你的投资决策正好在你自己的能力圈内。",
                         "我们之所以取得目前的成就，是因为我们关心的是寻找那些我们可以跨越的一英尺障碍，而不是去拥有什么能飞越七英尺的能力。",
                         "很多事情做起来都会有利可图，但是，你必须坚持只做那些自己能力范围内的事情，我们没有任何办法击倒泰森。",
                         "对你的能力圈来说，最重要的不是能力圈的范围大小，而是你如何能够确定能力圈的边界所在。如果你知道了能力圈的边界所在，你将比那些能力圈虽然比你大5倍却不知道边界所在的人要富有得多。",
                         "任何情况都不会驱使我做出在能力圈范围以外的投资决策。",
                         "我是一个非常现实的人，我知道自己能够做什么，而且我喜欢我的工作。也许成为一个职业棒球大联盟的球星非常不错，但这是不现实的。",
                         "对于大多数投资者而言，重要的不是他到底知道什么，而是他们是否真正明白自己到底不知道什么。",
                         "一定要在自己的理解力允许的范围内投资。",
                         "如果我们不能在自己有信心的范围内找到需要的，我们不会扩大范围。我们只会等待。",
                         "投资必须是理性的。如果你不能理解它，就不要做。",
                         "我们的工作就是专注于我们所了解的事情，这一点非常非常重要。",
                         "开始存钱并及早投资，这是最值得养成的好习惯。",
                         "一生能够积累多少财富，不取决于你能够赚多少钱，而取决于你如何投资理财，钱找人胜过人找钱，要懂得钱为你工作，而不是你为钱工作。"]
    func 标注() {
        
        for lie in 黄色列表 { if let range = attext.range(of: lie) {
            attext[range].foregroundColor = .accentColor
            attext.characters.replaceSubrange(range, with: lie+"（注：货币性资产是指持有的现金及将以固定或可确定金额的货币收取的资产，包括现金、应收账款和应收票据以及准备持有至到期的债券投资等这里的现金包括库存现金、银行存款和其他货币资金。）")
            attext[range].backgroundColor = .yellow
            attext[range].font = UIFont.boldSystemFont(ofSize: 25)}}
        for lie in 紫色列表 {
            if let range = attext.range(of: lie) {
                attext[range].foregroundColor = .teal
                attext.characters.replaceSubrange(range, with: lie+"（不好的东西）")
                attext[range].backgroundColor = .purple
            }
        }
        for lie in 绿色列表 {
            if let range = attext.range(of: lie) {
                attext[range].foregroundColor = .red
                attext.characters.replaceSubrange(range, with: lie+"（企业的根本）")
                attext[range].backgroundColor = .cyan
                attext[range].font = UIFont.boldSystemFont(ofSize: 25)
            }
        }
        
    }
    func 标注1(text: String) -> AttributedString {
        attext=AttributedString(text)
        for lie in 黄色列表 { if let range = attext.range(of: lie) {
            attext[range].foregroundColor = .accentColor
            attext.characters.replaceSubrange(range, with: lie+"（注：资产）")
            attext[range].backgroundColor = .yellow
            attext[range].font = UIFont.boldSystemFont(ofSize: 25)}}
        for lie in 紫色列表 {
            if let range = attext.range(of: lie) {
                attext[range].foregroundColor = .teal
                attext.characters.replaceSubrange(range, with: lie+"（不好的东西）")
                attext[range].backgroundColor = .purple
            }
        }
        for lie in 绿色列表 {
            if let range = attext.range(of: lie) {
                attext[range].foregroundColor = .red
                attext.characters.replaceSubrange(range, with: lie+"（企业的根本）")
                attext[range].backgroundColor = .cyan
                attext[range].font = UIFont.boldSystemFont(ofSize: 25)
            }
        }
        return attext
    }
    func 标注2(text: [String]) -> [AttributedString] {
        var attexts = [AttributedString]()
        for i in text{
            attext=AttributedString(i)
            for lie in 黄色列表 { if let range = attext.range(of: lie) {
                attext[range].foregroundColor = .accentColor
                attext.characters.replaceSubrange(range, with: lie+"（注：资产）")
                attext[range].backgroundColor = .yellow
                attext[range].font = UIFont.boldSystemFont(ofSize: 25)}}
            for lie in 紫色列表 {
                if let range = attext.range(of: lie) {
                    attext[range].foregroundColor = .teal
                    attext.characters.replaceSubrange(range, with: lie+"（不好的东西）")
                    attext[range].backgroundColor = .purple
                }
            }
            for lie in 绿色列表 {
                if let range = attext.range(of: lie) {
                    attext[range].foregroundColor = .red
                    attext.characters.replaceSubrange(range, with: lie+"（企业的根本）")
                    attext[range].backgroundColor = .cyan
                    attext[range].font = UIFont.boldSystemFont(ofSize: 25)
                }
            }
            attexts.append(attext)
            
        }
        return attexts
    }
}
