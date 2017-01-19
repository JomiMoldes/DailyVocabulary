//
// Created by MIGUEL MOLDES on 13/1/17.
// Copyright (c) 2017 MIGUEL MOLDES. All rights reserved.
//

import Foundation

@objc protocol REDOperationProtocol {

    var operation:Operation { get set }

    var dependencies:[REDOperationProtocol] { get set }

    var successDependencies:[REDOperationProtocol] { get set }

    func execute()

}
