 

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var alpha2: UILabel!
    
    @IBOutlet var alpha3: UILabel!
    
    
    @IBOutlet weak var population: UILabel!
    
    @IBOutlet var region: UILabel!
    
    
    
    
    var strregion = ""
    var strpopulation = ""
    var stralpha2 = ""
    var stralpha3 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alpha2.text = stralpha2
        alpha3.text = stralpha3
        region.text = strregion
        population.text =  strpopulation
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
 
}
