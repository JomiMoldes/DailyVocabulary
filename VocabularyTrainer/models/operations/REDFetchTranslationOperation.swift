//
// Created by MIGUEL MOLDES on 11/1/17.
// Copyright (c) 2017 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDFetchTranslationOperation : REDOperationProtocol {

    var operation: Operation

    let word : String
    let defaultLanguage : String
    let fallbackLanguage : String
    var translation : String?

    var dependencies = [REDOperationProtocol]()
    var successDependencies = [REDOperationProtocol]()

    init?(word:String, defaultLanguage:String, fallbackLanguage:String){
        self.word = word
        self.defaultLanguage = defaultLanguage
        self.fallbackLanguage = fallbackLanguage
        self.operation = REDAsynchronousOperation()
        (self.operation as! REDAsynchronousOperation).delegate = self
    }

    func execute() {
        let url = URL(string:"http://api.ultralingua.com/api/definitions/\(self.defaultLanguage)/\(self.fallbackLanguage)/\(self.word)")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard error == nil else {
                print("error")
                self.operation.cancel()
                (self.operation as! REDAsynchronousOperation).finishOperation()
                return
            }

            guard let data = data else {
                print("no data")
                self.operation.cancel()
                (self.operation as! REDAsynchronousOperation).finishOperation()
                return
            }

            let json = try? JSONSerialization.jsonObject(with: data, options:[])

            print("json")
            (self.operation as! REDAsynchronousOperation).finishOperation()
        }

        task.resume()
    }


}
