//
//  ViewAllVC.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/05.
//

import UIKit

class ViewAllVC: UIViewController {

    @IBOutlet weak var tabBar: UIView!
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var catergoryView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var catCollectionView: UICollectionView!
    
    var categories : [[String]] = [["Bakery", "Bakery"],["Fruit & Veg", "fruit & veg"],["Poultry", "Poultry"],["Beveragers", "beveragers"],["All", "all"]]
    
    var searchImages: ProductViewModel!
    var searchName: ProductViewModel!
    var checkLogged: Bool = (UserDefaults.standard.bool(forKey: "LoggedIn"))
    
    var count = 0
   // var data = [Product]()
     var proVM: ProductsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var myInstance = cartViewModel(cart: [])
        //myInstance.cartArray()
//        let appDomain = Bundle.main.bundleIdentifier!
//        UserDefaults.standard.removePersistentDomain(forName: appDomain)
//        UserDefaults.standard.synchronize()
        //countLabel.text = String(UserDefaults.standard.integer(forKey: "cartCount"))
        subView.layer.cornerRadius = 25
        //catergoryView.layer.cornerRadius = 25
        itemView.layer.cornerRadius = 25
        tabBar.layer.cornerRadius = 25
        collectionView.layer.cornerRadius = 25
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        //catCollectionView.layer.cornerRadius = 25
        catCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
                
        navigationItem.setHidesBackButton(true, animated: false)
        setup()
        
        if let flowLayout = catCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        catCollectionView.isPagingEnabled = true
        catCollectionView.isUserInteractionEnabled = true
        //print(data)
    }
    func setup() {
        
        guard let url = URL(string: "http://localhost:8081/api/products/getAllProducts") else {
            return
        }
        webService().getArticles(url: url) { food in
            
            if let food = food{
               
                self.proVM = ProductsViewModel(product: food)
         
                DispatchQueue.main.sync {
                    self.collectionView.reloadData()
                }
            }
            
        }
    }
    @IBAction func all() {
        setup()
    }
    @IBAction func bevFilter() {
        guard let url = URL(string: "http://localhost:8081/api/products/search?categoryName=Beveragers") else {
            return
        }
        webService().getArticles(url: url) { food in
            
            if let food = food{
               
                self.proVM = ProductsViewModel(product: food)
         
                DispatchQueue.main.sync {
                    self.collectionView.reloadData()
                }
            }
            
        }
    }
    
    @IBAction func vegFilter() {
        guard let url = URL(string: "http://localhost:8081/api/products/search?categoryName=Veg") else {
            return
        }
        webService().getArticles(url: url) { food in
            
            if let food = food{
               
                self.proVM = ProductsViewModel(product: food)
         
                DispatchQueue.main.sync {
                    self.collectionView.reloadData()
                }
            }
            
        }
    }
    
    @IBAction func meatFilter() {
        guard let url = URL(string: "http://localhost:8081/api/products/search?categoryName=Meat") else {
            return
        }
        webService().getArticles(url: url) { food in
            
            if let food = food{
               
                self.proVM = ProductsViewModel(product: food)
         
                DispatchQueue.main.sync {
                    self.collectionView.reloadData()
                }
            }
            
        }
    }
    
    @IBAction func bakeryFilter() {
        guard let url = URL(string: "http://localhost:8081/api/products/search?categoryName=Bakery") else {
            return
        }
        webService().getArticles(url: url) { food in
            
            if let food = food{
               
                self.proVM = ProductsViewModel(product: food)
         
                DispatchQueue.main.sync {
                    self.collectionView.reloadData()
                }
            }
            
        }
        
    }
}

extension ViewAllVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView == catCollectionView){
         return 1
        }
        return proVM == nil ? 0 : self.proVM.numberOfSections
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == catCollectionView){
           return 5
        }
        
        return self.proVM.numberOfRowsInSection(section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == catCollectionView){
            guard let cell2 = catCollectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? CollectionViewCell2 else {return UICollectionViewCell()}
            
            cell2.backgroundColor = UIColor(red: 0.85, green: 0.93, blue: 0.78, alpha: 1.00)
            cell2.layer.cornerRadius = 25
            cell2.catLabel.text = categories[indexPath.row][0]
            cell2.catImage.image = UIImage(named: String(categories[indexPath.row][1]))
             return cell2
        }

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}

        
        let proVM = self.proVM.productsAtIndex(indexPath.row)
       
        cell.textLabel.text = proVM.name
        cell.imageView.image = UIImage(named: String(proVM.image.imageURL))

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)/2
        if (collectionView == catCollectionView){
    
            return  CGSize(width: 110, height: 110)
        }
        return CGSize(width: size, height: size)
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(collectionView == catCollectionView){
            print([indexPath.row][0])
            if([indexPath.row][0] == 0){
                return bakeryFilter()
            }
            if([indexPath.row][0] == 1){
                return vegFilter()
            }
            if([indexPath.row][0] == 2){
                return meatFilter()
            }
            if([indexPath.row][0] == 3){
                return bevFilter()
            }
            if([indexPath.row][0] == 4){
                return all()
            }
        }
        
   
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC

        let proVM = self.proVM.productsAtIndex(indexPath.row)

        vc.pImage = proVM.image.imageURL
        vc.pName = proVM.name
        vc.pDescription = proVM.description
        vc.pPrice = Int(proVM.price)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
    

