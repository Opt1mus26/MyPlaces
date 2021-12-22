//
//  NewPlaceTableViewController.swift
//  MyPlaces
//
//  Created by Pavel Tsyganov on 22.12.2021.
//

import UIKit

class NewPlaceTableViewController: UITableViewController, UINavigationControllerDelegate {

    var newPlace: Place?
    
    var imageIsChanged = false
    
    @IBOutlet var placeImage: UIImageView!
    @IBOutlet var placeNameTF: UITextField!
    @IBOutlet var placeLocationTF: UITextField!
    @IBOutlet var placeTypeTF: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.isEnabled = false
        placeNameTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cameraIcon = UIImage(systemName: "camera.fill")
        let photoIcon = UIImage(systemName: "photo.fill")
        
        if indexPath.row == 0 {
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode .left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode .left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            present(actionSheet, animated: true)
            
        } else {
            view.endEditing(true)
        }
    }
    
    func saveNewPlace() {
        var image: UIImage?
        if imageIsChanged {
            image = placeImage.image
        } else {
            image = UIImage(systemName: "camera")
        }
        newPlace = Place(name: placeNameTF.text!,
                         location: placeLocationTF.text,
                         type: placeTypeTF.text,
                         image: image,
                         restaurantImage: nil)
    }
    
}

extension NewPlaceTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    @objc private func textFieldChanged() {
        if placeNameTF.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}

extension NewPlaceTableViewController: UIImagePickerControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleAspectFill
        imageIsChanged = true
        dismiss(animated: true)
    }
}
