import Foundation

class REDFetchConjugationOperation : MMOperationProtocol {

    var operation: Operation
    var dependencies = [MMOperationProtocol]()
    var successDependencies = [MMOperationProtocol]()

    var word : REDWord!
    let language : String

    init?(word:REDWord, language:String) {
        self.word = word
        self.language = language
        self.operation = MMAsynchronousOperation()
        (self.operation as! MMAsynchronousOperation).delegate = self
    }

    func execute() {
        guard word.isVerb else {
            self.operation.cancel()
            (self.operation as! MMAsynchronousOperation).finishOperation()
            return
        }

        let url = URL(string:"http://api.ultralingua.com/api/conjugations/\(self.language)/\(self.word.word!)")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard error == nil else {
                print("error")
                self.operation.cancel()
                (self.operation as! MMAsynchronousOperation).finishOperation()
                return
            }

            guard let data = data else {
                print("no data")
                self.operation.cancel()
                (self.operation as! MMAsynchronousOperation).finishOperation()
                return
            }

            let json = try? JSONSerialization.jsonObject(with: data, options:[])


            if let list = json as? [Any] {
                self.word.setupConjugation(json:list)
            }

            (self.operation as! MMAsynchronousOperation).finishOperation()
        }

        task.resume()



    }


}
