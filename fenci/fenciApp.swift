//
//  fenciApp.swift
//  fenci
//
//  Created by dengxinkaiacca@163.com on 6/26/22.
//

import SwiftUI

@main
struct fenciApp: App {
    var body: some Scene {
        WindowGroup {
            wve(news: 新闻数据(),labelnews: 标注数据())
        }
    }
}
