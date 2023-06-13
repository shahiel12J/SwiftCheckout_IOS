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

    var images : [String] = ["krush", "bread", "spinach", "steak", "chicken", "muffin", "blueberries", "orangejuice", "wors", "ginger", "peppers"]
    
    var namesDescription : [String] = ["Krush Cranberyy Juice R30.00", "Albany Brown Bread R17.50", "Baby Spinach R28.99", "Sirloin Steak R250.00", "Chicken Wings R55.00", "Muffins R30.00", "Blueberries R25.50", "Minute Maid Orange Juice R15", "Free Range Boerewors R100.00", "Ginger R30.00 per kg", "Rainbow Peppers R30.00"]
    
    var searchImages: ProductViewModel!
    var searchName: ProductViewModel!
    
    var count = 0
   // var data = [Product]()
     var proVM: ProductsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //countLabel.text = String(UserDefaults.standard.integer(forKey: "cartCount"))
        subView.layer.cornerRadius = 25
        catergoryView.layer.cornerRadius = 25
        itemView.layer.cornerRadius = 25
        tabBar.layer.cornerRadius = 25
        collectionView.layer.cornerRadius = 25
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        navigationItem.setHidesBackButton(true, animated: false)
        setup()
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
    @IBAction func all(_ sender: Any) {
        setup()
    }
    @IBAction func bevFilter(_ sender: Any) {
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
    
    @IBAction func vegFilter(_ sender: Any) {
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
    
    @IBAction func meatFilter(_ sender: Any) {
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
    
    @IBAction func bakeryFilter(_ sender: Any) {
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
        return proVM == nil ? 0 : self.proVM.numberOfSections
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.proVM.numberOfRowsInSection(section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}

        let proVM = self.proVM.productsAtIndex(indexPath.row)
       
        cell.textLabel.text = proVM.name
        cell.imageView.image = UIImage(named: String(proVM.image.imageURL))

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)/2

        return CGSize(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        
        let proVM = self.proVM.productsAtIndex(indexPath.row)
        
        vc.pImage = UIImage(named: String(proVM.image.imageURL))!
        vc.pName = proVM.name
        vc.pDescription = proVM.description
        vc.pPrice = Int(proVM.price)
        self.present(vc, animated: true)
    }
}
    

