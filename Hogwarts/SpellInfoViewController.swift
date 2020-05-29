import UIKit

class SpellInfoViewController: UIViewController {
    @IBOutlet var infoLabel: UITextView!
    
    var spell: Spell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.text = spell.effect.capitalized
    }
}
