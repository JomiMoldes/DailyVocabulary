//
// Created by MIGUEL MOLDES on 13/1/17.
// Copyright (c) 2017 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDSyncTestOperation : REDOperationProtocol {

    var operation: Operation

    var dependencies = [REDOperationProtocol]()
    var successDependencies = [REDOperationProtocol]()

    init?(){
        self.operation = REDSyncOperation()
        (self.operation as! REDSyncOperation).delegate = self
    }

    func execute() {
        print("REDSyncTestOperation execute")
//        self.operation.cancel()
    }
}
