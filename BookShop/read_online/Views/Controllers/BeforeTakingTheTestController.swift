//
//  BeforeTakingTheTestController.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 02/05/2024.
//

import UIKit

class BeforeTakingTheTestController : UIViewController {
    

    let majors : [String] = ["creative writing", "journalism", "more than one of the above", "none of them"]
    let langs: [String] = ["Russian", "English", "Arabic", "German"]
    
    
  lazy   var whatHaveYouStudied: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        textField.placeholder = "Choose the major that you have studied"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
        
    }()
    
    
  lazy  var chooseLanguage: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        textField.placeholder = "choose the language that you will be writing in"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
        
    }()
    
    lazy var startButton: UIButton = {
       let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.tintColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = .pi / 2
        return button
    }()
    
//    lazy  var picker1 : UIPickerView = {
//       let picker = UIPickerView()
//        picker.sizeToFit()
//        picker.delegate = self
//        picker.dataSource = self
//
//        return picker
//    }()
    
    //MARK: - UI Setup
    private func setUpUI() {
        self.view.addSubview(whatHaveYouStudied)
        self.view.addSubview(chooseLanguage)
        self.view.addSubview(startButton)
        
        whatHaveYouStudied.translatesAutoresizingMaskIntoConstraints = false
        chooseLanguage.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whatHaveYouStudied.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            whatHaveYouStudied.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            whatHaveYouStudied.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 12),
            
            chooseLanguage.topAnchor.constraint(equalTo: whatHaveYouStudied.bottomAnchor, constant: 30),
            chooseLanguage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            chooseLanguage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 12),
        
            startButton.topAnchor.constraint(equalTo: chooseLanguage.bottomAnchor, constant: 30),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

//extension BeforeTakingTheTestController: UIPickerViewDelegate, UIPickerViewDataSource {

    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//if pickerView == picker1 {
// return numberofitems for the first picker
//}ele if piceker view == picker 2 then we will return number of items for the second picker
//        return 1(number of items for each component) in the if and else cases
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        //if pickerView == picker1 {
// return numberofitems for the first picker
//}ele if piceker view == picker 2 then we will return number of items for the second picker
//    }
//
    
//}
