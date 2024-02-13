
import UIKit

class ViewController: UIViewController {
    var myCustomColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0) // sRGB
    var redd: CGFloat = 0
    var greend: CGFloat = 0
    var blued: CGFloat = 0
    var alphad: CGFloat = 0
    
    @IBOutlet weak var heavy: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
  

    @IBAction func sliderRed(_ sender: UISlider) {
        myCustomColor.getRed(&redd, green: &greend, blue: &blued, alpha: &alphad)
        myCustomColor = UIColor(red: CGFloat(sender.value), green: CGFloat(greend), blue: CGFloat(blued), alpha: CGFloat(alphad))
        heavy.backgroundColor = myCustomColor;
    }
    
    @IBAction func sliderGreen(_ sender: UISlider) {
        myCustomColor.getRed(&redd, green: &greend, blue: &blued, alpha: &alphad)
        myCustomColor = UIColor(red: CGFloat(redd), green: CGFloat(sender.value), blue: CGFloat(blued), alpha: CGFloat(alphad))
        heavy.backgroundColor = myCustomColor;
    }
    
    @IBAction func sliderBlue(_ sender: UISlider) {
        myCustomColor.getRed(&redd, green: &greend, blue: &blued, alpha: &alphad)
        myCustomColor = UIColor(red: CGFloat(redd), green: CGFloat(greend), blue: CGFloat(sender.value), alpha: CGFloat(alphad))
        heavy.backgroundColor = myCustomColor;
    }
    
    @IBAction func sliderAlpha(_ sender: UISlider) {
        heavy.alpha = CGFloat(sender.value);
    }
    
}

