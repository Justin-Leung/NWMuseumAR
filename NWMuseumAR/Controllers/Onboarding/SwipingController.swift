//
//  SwipingController.swift
//  NWMuseumAR
//
//  Created by Justin Leung on 4/10/18.
//  Copyright © 2018 NWMuseumAR. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .blue
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
