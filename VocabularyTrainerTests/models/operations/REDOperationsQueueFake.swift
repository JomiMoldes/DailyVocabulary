//
// Created by MIGUEL MOLDES on 14/1/17.
// Copyright (c) 2017 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import XCTest

@testable import VocabularyTrainer

class REDOperationsQueueFake : REDOperationsQueue {

    var completionExpectation : XCTestExpectation?

    override func addOperations(operations: [REDOperationProtocol]) {
        self.completionBlock = {
            self.completionExpectation?.fulfill()
        }
        super.addOperations(operations: operations)
    }


}
