//
//  ListOfCharactersTableViewDelegate.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/4/23.
//

import UIKit

final class ListOfCharactersTableViewDelegate: NSObject, UITableViewDelegate {
 
    var didTapOnCell: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
}
