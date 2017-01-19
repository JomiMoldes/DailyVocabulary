//
// Created by MIGUEL MOLDES on 13/1/17.
// Copyright (c) 2017 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDSyncOperation : Operation {

    weak var delegate:REDOperationProtocol?

    override func main() {
        self.delegate?.execute()
        super.main()
    }


}
