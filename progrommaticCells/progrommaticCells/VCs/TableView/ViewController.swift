//
//  ViewController.swift
//  progrommaticCells
//
//  Created by God on 10/11/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: View And Variable Setup
    var userView = UserView()
    var users = [User]() {
        didSet {
            userView.userCollection.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "UserCell", bundle: nil)
        userView.userCollection.register(nib, forCellWithReuseIdentifier: "UserCell")
        loadData()
        userView.userCollection.dataSource = self
        userView.userCollection.delegate = self
        addSubViews()
        userView.backgroundColor = .white
        userView.userCollection.backgroundColor = .white
    }
    
    //MARK: Private Functions
    private func addSubViews() {
        self.view.addSubview(userView)
    }
    private func loadData() {
        UsersFetchingService.manager.getUsers {(result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let userFromOnline):
                    self.users = userFromOnline
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

//MARK: Extensions And Delegations
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let user = users[indexPath.row]
        let cell = userView.userCollection.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.userName.text = "Name: \(user.name.first)"
        cell.userLocation.text = "Location: \(user.location.city)"
        var image = cell.profileImage
        if let url = NSURL(string: user.picture.large) {
            if let data = NSData(contentsOf: url as URL) {
                image!.image = UIImage(data: data as Data)
                image!.layer.borderWidth = 1
                image!.layer.masksToBounds = false
                image!.layer.borderColor = UIColor.black.cgColor
                image!.layer.cornerRadius = image!.frame.height/2
                image!.clipsToBounds = true
            }
        }
        return cell
    }
    
    
    
}

