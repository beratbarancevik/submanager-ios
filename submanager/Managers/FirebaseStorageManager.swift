//
//  FirebaseStorageManager.swift
//  submanager
//
//  Created by Berat Cevik on 11/29/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Firebase
import RxSwift
import UIKit

class FirebaseStorageManager {
    // MARK: - Properties
    lazy var storage = Storage.storage()
    
    let didReceiveUrl = PublishSubject<String>()
    let error = PublishSubject<Error>()
    let loading = PublishSubject<Bool>()
    
    // MARK: - Functions
    func uploadImageToFirebaseStorage(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            error.onNext(GenericError.default)
            return
        }
        
        loading.onNext(true)
        
        let folderName = Constants.customSubscriptionStorageFolder.rawValue
        let storageReference = storage.reference(withPath: folderName)
        storageReference.putData(imageData, metadata: nil) { [weak self] _, error in
            if let error = error {
                self?.loading.onNext(false)
                self?.error.onNext(error)
                print("Upload photo error: \(error.localizedDescription)")
                return
            }
            
            storageReference.downloadURL { [weak self] url, error in
                self?.loading.onNext(false)
                
                if let error = error {
                    self?.error.onNext(error)
                    print("ERROR: \(error.localizedDescription)")
                    return
                }
                
                if let url = url {
                    self?.didReceiveUrl.onNext(url.absoluteString)
                }
            }
        }
    }
}
