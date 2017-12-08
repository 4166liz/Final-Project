//
//  Global.swift
//  TalksBeauty
//
//  Created by sunny on 2017/11/6.
//  Copyright © 2017年 sunny. All rights reserved.
//

import Foundation
import Firebase

class GlobalInstance {
    static let sharedInstance = GlobalInstance()
    
    private init() {
        
    }
    
    var user: User!
}
