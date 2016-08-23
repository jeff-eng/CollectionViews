//
//  ViewController.swift
//  Collection
//
//  Created by Jeffrey Eng on 8/23/16.
//  Copyright © 2016 Jeffrey Eng. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    var array = [String]()
    var buttonArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        array = ["January","February","March","April"]
        
        buttonArray = ["January","February","March","April"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Specifies the number of collection view cells to be displayed
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        let label = cell.viewWithTag(1) as! UILabel
        label.text = array[indexPath.row]
        
        let button = cell.viewWithTag(2) as! UIButton
        button.titleLabel?.text = buttonArray[indexPath.row]
        
        return cell
    }

}

