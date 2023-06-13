import UIKit

class LaunchScreen: UIViewController {
    
    @IBOutlet weak var trolleyImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateTrolley()
        
        func animateTrolley() {
            // Set the initial position of the trolley offscreen to the left
            trolleyImageView.frame.origin.x = -trolleyImageView.frame.width
            
            // Animate the trolley moving from left to right
            UIView.animate(withDuration: 5.0, delay: 0.0, options: .curveLinear, animations: {
                self.trolleyImageView.frame.origin.x = self.view.frame.width
                
            }) { (_) in
                let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ViewAllVC") as? ViewAllVC
                
                self.navigationController?.pushViewController(storyboard!, animated: true)
            }
        }
        
    }
    
}
