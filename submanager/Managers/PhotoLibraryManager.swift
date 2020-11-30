//
//  PhotoLibraryManager.swift
//  submanager
//
//  Created by Berat Cevik on 11/29/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class PhotoLibraryManager: BaseManager {
    // MARK: - Functions
    func getImagePickerController() -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        return imagePickerController
    }
}
