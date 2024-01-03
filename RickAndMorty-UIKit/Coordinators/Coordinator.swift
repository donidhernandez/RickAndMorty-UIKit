//
//  Coordinator.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/3/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get }
        
    func start()
}

extension Coordinator {
    var navigationController: UINavigationController? { nil }
}
