//
//  ViewController.swift
//  T27FirestoreAppleExample
//
//  Created by NeonApps on 19.09.2022.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    var modelName = UITextField()
    var brandName = UITextField()
    var modelYear = UITextField()
    var saveButton = UIButton()
    var reference : DocumentReference? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createUI()
        
    }
    
    func createUI() {
        setDefaultSize(view: view)
        view.addSubview(modelYear)
        view.addSubview(brandName)
        view.addSubview(modelName)
        view.addSubview(saveButton)

        modelName.frame = CGRect(x: 0.2 * screenWidth, y: 0.1 * screenHeight, width: 0.6 * screenWidth, height: 40)
        modelName.backgroundColor = .systemGray4
        
        brandName.frame = CGRect(x: 0.2 * screenWidth, y: 0.2 * screenHeight, width: 0.6 * screenWidth, height: 40)
        brandName.backgroundColor = .systemGray4

        modelYear.frame = CGRect(x: 0.2 * screenWidth, y: 0.3 * screenHeight, width: 0.6 * screenWidth, height: 40)
        modelYear.backgroundColor = .systemGray4
        
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .blue
        saveButton.setTitle("Save", for: .normal)
        saveButton.frame = CGRect(x: 0.32 * screenWidth, y: 0.4 * screenHeight, width: 0.4 * screenWidth, height: 40)
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        
        modelName.placeholder = "Model"
        brandName.placeholder = "Brand"
        modelYear.placeholder = "Year"


    }
    
    @objc func saveButtonClicked() {
        print("button clicked :) ")
        let db = Firestore.firestore()
        reference = db.collection("Phone Collection").addDocument(data: [
            "modelName" : modelName.text,
            "brandName" : brandName.text,
            "modelYear" : modelYear.text], completion: { error in
                if error != nil {
                    print("Error occured!!!")
                }else {
                    print("Document ID \(self.reference!.documentID)")
                }
            })
        
        
        
        let destinationVC = GetDataViewController()
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true)
        
        
        
        
    }


}

