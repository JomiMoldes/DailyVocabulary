import Foundation

class REDInputWordViewModel {

    var userSession : REDUserSession!

    var operationQueue : MMOperationsQueue = MMOperationsQueue()

    init?(userSession:REDUserSession){
        self.userSession = userSession
    }

    func searchWord(word:String) {
        if userSession.currentWord == nil {
            userSession.currentWord = REDWord(wordName: word)
        }
        userSession.currentWord?.word = word
        let word = userSession.currentWord!
        let translation1 = REDFetchTranslationOperation(word: word, defaultLanguage: "de", fallbackLanguage: "en")!
        let translation2 = REDFetchTranslationOperation(word: word, defaultLanguage: "en", fallbackLanguage: "de")!
        translation2.dependencies = [translation1]

        operationQueue.addOperations(operations: [translation1, translation2])

    }
    
}
