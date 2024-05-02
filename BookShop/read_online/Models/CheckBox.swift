//
//  CheckBox.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 02/05/2024.
//
//

import UIKit

final class CheckBox: UIView {
    
    var isChecked = true
    
     lazy var imageView: UIImageView = {
        let iv = UIImageView()
         iv.isHidden = false
         iv.contentMode = .scaleAspectFit
         iv.tintColor = .systemGreen
         iv.image = UIImage(systemName: "checkmark.rectangle.fill")
        return iv
    }()
    
    let boxView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.1
        view.layer.borderColor = UIColor.label.cgColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(boxView)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        boxView.frame = CGRect(x: 7, y: 7, width: frame.size.width-14, height: frame.size.width-14)
        imageView.frame = bounds
    }
    
    func toogle() {
        self.isChecked = !isChecked
        imageView.isHidden = !isChecked
        print(isChecked)
    }
    
}
//import UIKit
//
//final class CheckBox: UIView{
//    
//    private var isChecked = false
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        layer.borderWidth = 0.5
//        layer.borderColor = UIColor.secondaryLabel.cgColor
//        layer.cornerRadius = frame.size.width / 2
//        backgroundColor = .systemBackground
//
//        
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    func toogle() {
//        
//        self.isChecked = !isChecked
//        if self.isChecked {
//            backgroundColor = .systemBlue
//       }else {
//           backgroundColor = .systemBackground
//       }
//    }
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        layer.borderColor = UIColor.label.cgColor
//    }
//}
