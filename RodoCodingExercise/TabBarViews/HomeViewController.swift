//
//  HomeViewController.swift
//  RodoCodingExercise
//
//  Created by Junior Figuereo on 9/4/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let vehicleType: [String] = [
        "Compact",
        "Minivan",
        "Convertible",
        "Sedan",
        "Coupe",
        "Small SUV",
        "Hatchback",
        "Sports",
        "Hybrid",
        "Electric",
        "SUV",
        "Midsize",
        "Truck"
    ]
    
    lazy var titleTextView:UITextField = {
        let textFiled = UITextField()
        textFiled.text = "RODO"
        textFiled.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        textFiled.font = UIFont.boldSystemFont(ofSize: 60)
        textFiled.textAlignment = .center
        textFiled.textColor = .systemGreen
//        textFiled.layer.borderColor = UIColor.blue.cgColor
//        textFiled.layer.borderWidth = 1
        return textFiled
    }()
    
    lazy var searchFieldContainer: UIView = {
        let sampleContainer = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 45.86))
        sampleContainer.backgroundColor = .white
        sampleContainer.layer.cornerRadius = 20
        return sampleContainer
    }()
    
    lazy var searchField: UITextField = {
        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 330, height: 45.86))
        sampleTextField.placeholder = "SEARCH MAKE AND MODEL"
        //        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        //            sampleTextField.borderStyle = .roundedRect
        sampleTextField.layer.cornerRadius = 15.0
        //            sampleTextField.layer.borderWidth = 1.0
        sampleTextField.layer.borderColor = UIColor.white.cgColor
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        sampleTextField.delegate = self
        return sampleTextField
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorStyle.homeDarkGreen
        setupViews()
    }
    
    func setupViews() {
        
        //rodo title
        view.addSubview(titleTextView)
        
        //search container + search field
        view.addSubview(searchFieldContainer)
        searchFieldContainer.addSubview(searchField)
        
        //constraints
        searchFieldContainer.center = view.center
        searchField.pinToSideEdgesOfSuperview(withOffset: 5)
        searchField.centerVerticallyInSuperview()
        titleTextView.positionAbove(searchFieldContainer, withOffset: 10)
        titleTextView.centerHorizontallyInSuperview()
    }
}


extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        print("text field entered:", searchField.text as Any)
        // may be useful: textField.resignFirstResponder()
        return true
    }
    
}
