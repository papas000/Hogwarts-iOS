import UIKit

class CharacterViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: character.name) {
            //navigationItem.rightBarButtonItem?.title = "Unlike"
            navigationItem.rightBarButtonItem?.image = UIImage(named: "heart_full.png")
        }
        else {
            //navigationItem.rightBarButtonItem?.title = "Like"
            navigationItem.rightBarButtonItem?.image = UIImage(named: "heart_empty.png")
        }
        
        let imgUrl = URL(string: character.image)!
        
        do {
            let data = try Data(contentsOf: imgUrl)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        } catch let error {
            print("Image could not be loaded: \(error)")
        }
        
    }
    
    @IBAction func likeCharacter() {
        if UserDefaults.standard.bool(forKey: character.name) {
            //CharacterManager.main.delete(character: character)
            UserDefaults.standard.set(false, forKey: character.name)
            //navigationItem.rightBarButtonItem?.title = "Like"
            navigationItem.rightBarButtonItem?.image = UIImage(named: "heart_empty.png")
        }
        else {
            //let _ = CharacterManager.main.favorite(character: character)
            UserDefaults.standard.set(true, forKey: character.name)
            //navigationItem.rightBarButtonItem?.title = "Unlike"
            navigationItem.rightBarButtonItem?.image = UIImage(named: "heart_full.png")
            }
    }
}
