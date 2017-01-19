//
// Created by MIGUEL MOLDES on 11/1/17.
// Copyright (c) 2017 MIGUEL MOLDES. All rights reserved.
//

import Foundation

struct REDWord {

    let word : String
    var translation : String!
    var isVerb = true
    var article : String?
    var preterite : String?
    var participle : String?

    init?(json:[String:Any], wordName: String) {
        self.word = wordName
        print("json:", json)
    }
}