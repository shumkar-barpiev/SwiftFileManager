//
//  SecondViewController.swift
//  ReadWriteTextFile
//
//  Created by User on 22/1/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    public var sessionFileDirectory: URL?
    public var manager: FileManager?
    var user: User?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = user?.userName
        print(sessionFileDirectory!.path)
        print(manager!)
    }
    

//        if (manager!.fileExists(atPath: sessionFileDirectory!.path)){
//            do{
//                try manager!.removeItem(at: sessionFileDirectory!)
//                if !(manager!.fileExists(atPath: sessionFileDirectory!.path)){
//                    print(sessionFileDirectory)
//                    let controller = storyboard?.instantiateViewController(withIdentifier: "SwitchViewController") as! UIViewController
//
//                    controller.modalPresentationStyle = .fullScreen
//                    present(controller, animated: false, completion: nil)
//                }
//
//            } catch{
//                print(error)
//            }
//        }
    
    
    
    @IBAction func tapLogout(_ sender: Any) {
        print("hello")
    }
    
    
    
}


