//
// Created by MIGUEL MOLDES on 13/1/17.
// Copyright (c) 2017 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDSyncTestOperation : MMOperationProtocol {

    var operation: Operation

    var dependencies = [MMOperationProtocol]()
    var successDependencies = [MMOperationProtocol]()

    init?(){
        self.operation = MMSyncOperation()
        (self.operation as! MMSyncOperation).delegate = self
    }

    func execute() {
        print("REDSyncTestOperation execute")
//        self.operation.cancel()
    }
}
