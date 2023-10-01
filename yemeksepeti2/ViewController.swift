//
//  ViewController.swift
//  YemekSepetiTasarim
//
//  Created by Büşra Özcan on 29.09.2023.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var campaign2: UIView!
    @IBOutlet weak var campaign1: UIView!
    
    @IBOutlet weak var sloganView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var products: [Product] = []
    
    let cellIdentifier = "ProductCell"
   
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = [
            Product(name: "Pankek", price: "0 TL gönderim ücreti", category: "₺₺₺ Pankek && Avrupa Mutfağı", image: "yemek1"),
            Product(name: "Pankek", price: "0 TL gönderim ücreti", category: "₺₺₺ Pankek && Avrupa Mutfağı",  image: "yemek1")
        ]
        
        adjustNavigationBar()
        
        searchBar.placeholder = "Restoran veya mağaza arayın"
        searchBar.searchTextField.backgroundColor = UIColor.white
        
        searchBar.barTintColor = UIColor(named: "anaRenk")
        searchBar.backgroundColor = UIColor(named: "anaRenk")
        searchBar.searchTextField.textColor = UIColor.gray
        searchBar.searchTextField.tintColor = UIColor.gray
        searchBar.searchTextField.layer.cornerRadius = 17.0
        searchBar.searchTextField.layer.masksToBounds = true

        campaign1.layer.cornerRadius = 10
        campaign1.clipsToBounds = true
        campaign2.layer.cornerRadius = 10
        campaign2.clipsToBounds = true
        
        collectionView.dataSource = self
        
        
        sloganView.layer.borderWidth = 1.0
        if let borderColor = UIColor(named: "grayBackground") {
            sloganView.layer.borderColor = borderColor.cgColor
        }
        sloganView.layer.cornerRadius = 10.0
        sloganView.clipsToBounds = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ProductCollectionViewCell
        let product = products[indexPath.row]
        
        // Hücreyi verilerle doldurun
        cell.configure(with: product)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Kullanıcı bir hücreyi seçtiğinde yapılacak işlemleri burada gerçekleştirin
    }

    func adjustNavigationBar(){
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor(named: "anaRenk")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "titleTextColor")]
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
        
        // nav itemlerini oluşturma
        // Hamburger Menu
        let hamburgerBtn = UIBarButtonItem()
        let hamburger = UIImage(named: "hamburger")
        let hamburgerResized = resizeImage(image: hamburger, targetSize: CGSize(width: 18, height: 18))
        let whiteHamburger = maskImage(image: hamburgerResized, color: .white)
        let hamburgerLast = UIImageView(image: whiteHamburger)
        hamburgerBtn.customView = hamburgerLast
        navigationItem.leftBarButtonItem = hamburgerBtn
        
        // Favori Butonu
        let favoriBtn = UIBarButtonItem()
        let heart = UIImage(named: "heart2")
        let heartResized = resizeImage(image: heart, targetSize: CGSize(width: 20, height: 20))
        let whiteHeart = maskImage(image: heartResized, color: .white)
        let heartLast = UIImageView(image: whiteHeart)
        favoriBtn.customView = heartLast
        
        // Boşluk UIBarButtonItem'ı oluşturun (10 piksel boşluk)
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spaceBtn.width = 20
        
        // Sepet Butonu
        let sepetBtn = UIBarButtonItem()
        let basket = UIImage(named: "shopping-basket2")
        let basketResized = resizeImage(image: basket, targetSize: CGSize(width: 20, height: 20))
        let whiteBasket = maskImage(image: basketResized, color: .white)
        let basketLast = UIImageView(image: whiteBasket)
        sepetBtn.customView = basketLast
        
        // Sağ taraftaki UIBarButtonItem'ları ayarlayın
        navigationItem.rightBarButtonItems = [sepetBtn, spaceBtn, favoriBtn]
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        
        // Üstteki label (bold)
        let titleLabelBold = UILabel()
        titleLabelBold.text = "Ev"
        titleLabelBold.font = UIFont.boldSystemFont(ofSize: 16.0)
        titleLabelBold.textColor = .white
        titleLabelBold.sizeToFit()
        
        // Alttaki label (normal)
        let titleLabelNormal = UILabel()
        titleLabelNormal.text = "Bu benim ev adresim"
        titleLabelNormal.font = UIFont.systemFont(ofSize: 13.0)
        titleLabelNormal.textColor = .white
        titleLabelNormal.sizeToFit()
        
        
        containerView.addSubview(titleLabelBold)
        containerView.addSubview(titleLabelNormal)
        titleLabelBold.frame.origin = CGPoint(x: -35, y: 0)
        titleLabelNormal.frame.origin = CGPoint(x: -35, y: titleLabelBold.frame.maxY + 4) // Altta 4 piksel boşluk
        navigationItem.titleView = containerView
    }
    
    
    // Resmi yeniden boyutlandırmak için işlev
    func resizeImage(image: UIImage?, targetSize: CGSize) -> UIImage? {
        guard let image = image else { return nil }
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        let newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    // butona ekleyecegimiz resimler siyah oldugu için beyaza cevirme
    func maskImage(image: UIImage?, color: UIColor) -> UIImage? {
        guard let image = image else { return nil }
            
        let rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
            
        let context = UIGraphicsGetCurrentContext()
        image.draw(in: rect)
            
        context?.setFillColor(color.cgColor)
        context?.setBlendMode(.sourceAtop)
        context?.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
            
        return newImage
    }
}

