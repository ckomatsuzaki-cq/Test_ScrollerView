//
//  LayoutList.swift
//  Test_ScrollView
//
//  Created by 小松崎千春 on 2021/05/10.
//

import Foundation
import UIKit

final class LayoutList: NSObject {
    
    var qcId: Int
    var layouts: [Layout]
    
    init(qcId: Int, layouts: [Layout]) {
        self.qcId = qcId
        self.layouts = layouts
        
        super.init()
    }
    
}

protocol Layout {
    var inactiveCellHeight: CGFloat { get }
    var activeCellHeight: CGFloat { get }
    var reuseIdentifier: String { get }
}
