//
//  VehiclesViewController.swift
//  RodoCodingExercise
//
//  Created by Junior Figuereo on 9/5/22.
//

import UIKit

class VehiclesViewController: UIViewController {
    
    let vehicleColumn1: [String] = [
        "Compact",
        "Convertible",
        "Coupe",
        "Hatchback",
        "Hybrid/Electric",
        "Midsize"
    ]
    
    let vehicleColumn2: [String] = [
        "Minivan",
        "Sedan",
        "Small SUV",
        "Sports",
        "SUV",
        "Truck"
    ]
    
    
    lazy var Column1Vehicles: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.isHidden = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        for name in vehicleColumn1 {
            stackView.addArrangedSubview(newVehicleType(name: name))
        }
        stackView.spacing = 22.6
        return stackView
    }()
    
    lazy var Column2Vehicles: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.isHidden = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        for name in vehicleColumn2 {
            stackView.addArrangedSubview(newVehicleType(name: name))
        }
        stackView.spacing = 22.6
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Vehicle Type"
        view.backgroundColor = ColorStyle.vehicleTypesBg
        self.navigationController?.navigationBar.isTranslucent = false
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupViews() {
        view.addSubview(Column1Vehicles)
        view.addSubview(Column2Vehicles)
        
        
        Column1Vehicles.pinToTopAndBottomEdgesOfSuperview(withOffset: 20)
        Column1Vehicles.pinToLeftEdgeOfSuperview(withOffset: 104)
        Column2Vehicles.pinToTopAndBottomEdgesOfSuperview(withOffset: 20)
        Column2Vehicles.pinToRightEdgeOfSuperview(withOffset: 104)
    }
    
    func newVehicleType(name: String) -> UIView {
        //105, 50.4
        let image = UIImage(named: "car")?.imageResize(sizeChange: CGSize(width: 105, height: 50))
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = ColorStyle.vehicleTypesBg
        let text: UITextField = {
            let textFiled = UITextField()
            textFiled.text = name
            textFiled.frame = CGRect(x: 0, y: 0, width: 105, height: 10)
            textFiled.font = UIFont.boldSystemFont(ofSize: 12)
            textFiled.textAlignment = .center
            textFiled.textColor = .white
            return textFiled
        }()
        
        let newView = UIView()
        newView.addSubview(imageView)
        newView.addSubview(text)
        
        imageView.centerHorizontallyInSuperview()
        imageView.pinToTopEdgeOfSuperview()
        text.centerHorizontallyInSuperview()
        text.positionBelow(imageView)
        
        return newView
    }
}



