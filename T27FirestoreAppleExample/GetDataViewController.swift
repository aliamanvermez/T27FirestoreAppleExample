//
//  GetDataViewController.swift
//  T27FirestoreAppleExample
//
//  Created by NeonApps on 19.09.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseRemoteConfig
class GetDataViewController: UIViewController {
    var getModelYear = UILabel()
    var getModel = UILabel()
    var getBrand = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createUI()
        startRemoteConfig()
    }
    
    func createUI() {
        setDefaultSize(view: view)
        getModel.frame = CGRect(x: 0.2 * screenWidth, y: 0.1 * screenHeight, width: 0.6 * screenWidth, height: 40)
        getBrand.frame = CGRect(x: 0.2 * screenWidth, y: 0.2 * screenHeight, width: 0.6 * screenWidth, height: 40)
        getModelYear.frame = CGRect(x: 0.2 * screenWidth, y: 0.3 * screenHeight, width: 0.6 * screenWidth, height: 40)
        view.addSubview(getModel)
        view.addSubview(getBrand)
        view.addSubview(getModelYear)
        
        getDataFromFirestore()
        
    }
    
    func getDataFromFirestore() {
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Phone Collection").addSnapshotListener { snapshot, error in
            if error != nil {
                print("error !!!!")
            }else {
                if snapshot?.isEmpty != true {
                    for document in snapshot!.documents {
                        let modelYearGet = document.get("modelYear") as? String
                        self.getModelYear.text = "Model Year : \(String(describing: modelYearGet))"
                        
                        let modelNameGet = document.get("modelName") as? String
                        self.getModel.text = "Model Name : \(String(describing: modelNameGet))"
                        
                        let brandNameGet = document.get("brandName") as? String
                        self.getBrand.text = "Brand : \(String(describing: brandNameGet))"


                    }
                }
            }
        }

    }
    
    func startRemoteConfig(){
        var remoteConfig = RemoteConfig.remoteConfig()
        
        let settings = RemoteConfigSettings()
        
        settings.minimumFetchInterval = 0
        
        remoteConfig.setDefaults(fromPlist: "remote-config-defaults")
        
    }
    

   

}
