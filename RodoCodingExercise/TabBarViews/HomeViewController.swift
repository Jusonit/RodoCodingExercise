//
//  HomeViewController.swift
//  RodoCodingExercise
//
//  Created by Junior Figuereo on 9/4/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var filteredSearch = [Any]()
    
    lazy var titleTextView: UITextField = {
        let textFiled = UITextField()
        textFiled.text = "RODO"
        textFiled.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        textFiled.font = UIFont.boldSystemFont(ofSize: 60)
        textFiled.textAlignment = .center
        textFiled.textColor = ColorStyle.homeTextGreen
        return textFiled
    }()
    
    lazy var searchFieldContainer: UIView = {
        let sampleContainer = UIView(frame: CGRect(x: 0, y: 0, width: 330, height: 45.86))
        sampleContainer.backgroundColor = .white
        sampleContainer.layer.cornerRadius = 20
        return sampleContainer
    }()
    
    lazy var searchField: UITextField = {
        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 330, height: 45.86))
        sampleTextField.placeholder = "SEARCH MAKE AND MODEL"
        sampleTextField.layer.cornerRadius = 15.0
        sampleTextField.layer.borderColor = UIColor.white.cgColor
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        sampleTextField.delegate = self
        return sampleTextField
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 330, height: 45.86))
        button.setTitle("SEARCH BY VEHICLE TYPE", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2.0
        button.layer.borderColor = ColorStyle.homeTextGreen?.cgColor
        button.sizeToFit()
        return button
    }()
    
    lazy var dealsButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 330, height: 45.86))
        button.setTitle("SEE DEALS OF THE DAY", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.addTarget(self, action: #selector(dealsButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2.0
        button.layer.borderColor = ColorStyle.homeTextGreen?.cgColor
        button.sizeToFit()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorStyle.homeDarkGreen
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func setupViews() {
        
        //adding subviews
        //title
        view.addSubview(titleTextView)
        //search container + search field
        view.addSubview(searchFieldContainer)
        searchFieldContainer.addSubview(searchField)
        //search button
        view.addSubview(searchButton)
        //deals button
        view.addSubview(dealsButton)
        
        //constraints
        //title
        titleTextView.positionAbove(searchFieldContainer, withOffset: 10)
        titleTextView.centerHorizontallyInSuperview()
        //search field
        searchFieldContainer.center = view.center
        searchField.pinToSideEdgesOfSuperview(withOffset: 5)
        searchField.centerVerticallyInSuperview()
        //search button
        searchButton.positionBelow(searchFieldContainer, withOffset: 50)
        searchButton.centerHorizontallyInSuperview()
        searchButton.sizeWidthToWidth(of: searchFieldContainer)
        //deals button
        dealsButton.positionBelow(searchButton, withOffset: 20)
        dealsButton.centerHorizontallyInSuperview()
        dealsButton.sizeWidthToWidth(of: searchFieldContainer)
    }
    
    @objc func searchButtonTapped() {
        let vehiclesVC = VehiclesViewController()
        vehiclesVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vehiclesVC, animated: true)
    }
    
    @objc func dealsButtonTapped() {
        textFieldShouldReturn(searchField)
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
        // may be useful: textField.resignFirstResponder()
        let fullSearch = searchField.text?.components(separatedBy: " ")
        
        if let path = Bundle.main.path(forResource: "Exercise_Dataset", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let json = jsonResult as? [Any] {
                    //json is an array
                    filteredSearch = json
                    
                    guard let fullSearch = fullSearch else { return true }
                    let numOfKeywords = fullSearch.count
                    
                    filteredSearch = filteredSearch.filter({ item in
                        for i in 0...numOfKeywords-1 {
                            if (item as AnyObject).contains(fullSearch[i] as Any) {
                                return (item as AnyObject).contains(fullSearch[i] as Any)
                            }
                        }
                        return false
                    })
                    print("filtered Search: ", filteredSearch)
                    print("Number of Vehicles:", filteredSearch.count)
                }
            } catch {
                print("error:", error)
            }
        }
        
        return true
    }
    
}
