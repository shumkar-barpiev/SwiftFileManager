//
//  SwitchViewController.swift
//  ReadWriteTextFile
//
//  Created by User on 22/1/23.
//

import UIKit

class SwitchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var didLogout = true
        
        if didLogout{
            let controller = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! UIViewController
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: false, completion: nil)
        }else{
            let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! UIViewController
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: false, completion: nil)
        }
    }
    
    
    
    
    private func checkFile() -> Bool{
        
        return false
    }
    

}
