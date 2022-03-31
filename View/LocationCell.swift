//
//  LocationCell.swift
//  UberClone
//
//  Created by user on 31/03/22.
//

import UIKit
import MapKit

class LocationCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "123 Main Street"
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "321 Main Street"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none 
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, addressLabel])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 4
        
        addSubview(stack)
        stack.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 8)    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
