//
//  ViewController.swift
//  CustomTabar
//
//  Created by Huy Than Duc on 11/12/2020.
//

import UIKit
struct TabBarItem {
    let title : String
    let image : String
}
class ViewController: UIViewController {
    @IBOutlet weak var tabBarCollection: UICollectionView!
    let list : [TabBarItem] = [
        TabBarItem(title: "Tìm kiếm", image: "search"),
        TabBarItem(title: "Thông báo", image: "notification"),
        TabBarItem(title: "Trang chủ", image: "home"),
        TabBarItem(title: "Yêu thích", image: "folder"),
        TabBarItem(title: "Đăng nhập", image: "user")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarCollection.delegate = self
        tabBarCollection.dataSource = self
        tabBarCollection.collectionViewLayout.invalidateLayout()
        tabBarCollection.register(TabBarCell.self, forCellWithReuseIdentifier: TabBarCell.identification)
        tabBarCollection.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        print(tabBarCollection.frame.width)
        print(tabBarCollection.frame.width/5)
    }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = list[indexPath.row]
        let cell = tabBarCollection.dequeueReusableCell(withReuseIdentifier: TabBarCell.identification, for: indexPath) as! TabBarCell
        if let image = UIImage(named: item.image) {
            cell.imageView.image = image.withRenderingMode(.alwaysTemplate)
            cell.title.text = item.title
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let orientation = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.interfaceOrientation
        if(orientation == .landscapeLeft || orientation == .landscapeRight)
        {
            return CGSize(width: tabBarCollection.frame.width/4, height: tabBarCollection.frame.height)
        } else {
            return CGSize(width: tabBarCollection.frame.width/5, height: tabBarCollection.frame.height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
