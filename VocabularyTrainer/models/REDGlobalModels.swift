//
// Created by MIGUEL MOLDES on 21/1/17.
// Copyright (c) 2017 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDGlobalModels {

    static let sharedInstance = REDGlobalModels()

    let userSession : REDUserSession

    fileprivate init() {
        self.userSession = REDUserSession()

    }

}
