//
//  ViewController.swift
//  ReadWriteTextFile
//
//  Created by User on 22/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var userIdTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInButtonAction(_ sender: Any) {
        let manager = FileManager.default
         
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask ).first else {
            return
        }
        print(url.path)
        
        let newFolder = url.appendingPathComponent("BitirmeTezi").appendingPathComponent("Sessions")
        let sessionFileDirectory = newFolder.appendingPathComponent("session.txt")
        
        print(directoryExistsAtPath(sessionFileDirectory.path))
        
        if directoryExistsAtPath(newFolder.path){
            if directoryExistsAtPath(sessionFileDirectory.path){
                do {
                    let text2 = try String(contentsOf: sessionFileDirectory, encoding: .utf8)
                    print(text2)
                    
                    let user = User(id: Int(userIdTextField.text ?? "0") ?? 0 , userName: usernameTextField.text ?? "no name")
                    
                    let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
                    controller.manager = manager
                    controller.sessionFileDirectory = sessionFileDirectory
                    controller.user = user
                    
                    controller.modalPresentationStyle = .fullScreen
                    present(controller, animated: true, completion: nil)
                }
                catch {
                    print(error)
                }
            }else{
                let data = userIdTextField.text!.data(using: .utf8) ?? "empty".data(using: .utf8)
                createSessionFile(manager, sessionFileDirectory, data!)
            }
        }else{
            createFolder(manager, newFolder)
        }
    }
    
    private func createFolder(_ manager: FileManager, _ newFolder: URL){
        do{
            try manager.createDirectory(
                at: newFolder,
                withIntermediateDirectories: true,
                attributes: [:])
        }catch{
            print(error)
        }
    }
    
    private func createSessionFile(_ manager: FileManager, _ filePath: URL, _ data: Data){
        do{
            try manager.createFile(
                atPath: filePath.path,
                contents: data,
                attributes: [FileAttributeKey.creationDate : Date()])
        }catch{
            print(error)
        }
    }
    
    fileprivate func directoryExistsAtPath(_ path: String) -> Bool {
        let exists = FileManager.default.fileExists(atPath: path)
        return exists
    }
    
}

