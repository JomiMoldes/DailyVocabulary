//
// Created by MIGUEL MOLDES on 11/1/17.
// Copyright (c) 2017 MIGUEL MOLDES. All rights reserved.
//

import Foundation

struct REDWord {

    var word : String!
    var translation : String!
    var isVerb = true
    var article : String?
    var past : String?
    var participle : String?

    init?(json:[String:Any], wordName: String) {
        self.word = wordName
    }

    init?(wordName:String){
        self.word = wordName
    }


    mutating func setupTranslation(json:[Any]) {

        if let elements = json[0] as? [String:Any] {
            self.translation = elements["text"] as! String
            if let grammar = elements["partofspeech"] as? [String:Any] {
                self.isVerb = (grammar["partofspeechcategory"] as! String) == "verb" ? true : false
            }

        }


    }

}