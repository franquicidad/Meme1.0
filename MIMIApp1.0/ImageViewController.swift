//
//  ImageViewController.swift
//  MIMIApp1.0
//
//  Created by MAC on 12/05/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    public var imagePickerController:UIImagePickerController?

    @IBOutlet weak var imageViewMeme: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
            guard let image = info[.originalImage] as? UIImage else{
                return self.imagePickerControllerDidCancel(imagePickerController)
            }
        self.selectedImage = image
        
        picker.dismiss(animated: true){
          picker.delegate = nil
            self.imagePickerController = nil
        }
        
        dismiss(animated: true, completion: nil)
        

    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true){
            picker.delegate = nil
            self.imagePickerController = nil
        }

    }
    @IBAction func pickAnImage(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    
}

