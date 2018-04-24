//
//  GameDetailAssembly.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import UIKit

final public class DetailGameAssembly {
    
    let navigationController: UINavigationController
    let webServiceAssembly: WebServiceAssembly
    
    init(webServiceAssembly: WebServiceAssembly, navigationController: UINavigationController) {
        self.webServiceAssembly = webServiceAssembly
        self.navigationController = navigationController
        
    }
    
}
