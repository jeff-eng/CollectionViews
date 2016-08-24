//
//  ViewController.swift
//  PhotoAlbumCollectionView
//
//  Created by Jeffrey Eng on 8/23/16.
//  Copyright © 2016 Jeffrey Eng. All rights reserved.
//

import UIKit
import Photos

class ViewController: UICollectionViewController {

    var imageArray = [UIImage]()
    
    func retrievePhotos() {
        
        let imgManager = PHImageManager.defaultManager()
        
        // set the request options; synchronous is true to grab all the images and delivery mode to opportunistic to balance image quality and speed of retrieval
        let requestOptions = PHImageRequestOptions()
        requestOptions.synchronous = true
        requestOptions.deliveryMode = .Opportunistic
        
        // set how we want photos to be fetched; by date created, ascending equal to false so that first image that shows up is the most recent
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        if let fetchResult: PHFetchResult = PHAsset.fetchAssetsWithMediaType(.Image, options: fetchOptions) {
            
            if fetchResult.count > 0 {
                for i in 0..<fetchResult.count {
                    imgManager.requestImageForAsset(fetchResult.objectAtIndex(i) as! PHAsset, targetSize: CGSize(width: 200, height: 200), contentMode: .AspectFill, options: requestOptions, resultHandler: {
                        image, error in
                        
                        self.imageArray.append(image!)
                    })
                }
            } else {
                print("There are no photos available.")
            }
        }
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        
        imageView.image = imageArray[indexPath.row]
        
        return cell
    }
}

