//
//  UserView.swift
//  progrommaticCells
//
//  Created by God on 10/11/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class UserView: UIView {
    
    //Collection View
    let userCollection: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x:0 , y: 0, width: 350, height: 600), collectionViewLayout: UICollectionViewFlowLayout.init())
        let layOut: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layOut.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collectionView.setCollectionViewLayout(layOut, animated: true)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func commonInit() {
    addSubview(userCollection)
    setConstraints()
    }
    private func setConstraints() {
        
        //User Collection Constraints
    userCollection.translatesAutoresizingMaskIntoConstraints = false
        [userCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), userCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10), userCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: -10), userCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)].forEach{$0.isActive = true}
    }

    
    
    
    
    
    
    
}
