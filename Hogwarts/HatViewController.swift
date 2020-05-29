import UIKit

class HatViewController: UIViewController {
    @IBOutlet var ravenclawIMG: UIImageView!
    @IBOutlet var hufflepuffIMG: UIImageView!
    @IBOutlet var slytherinIMG: UIImageView!
    @IBOutlet var gryffindorIMG: UIImageView!
    @IBOutlet var sortLabel: UILabel!
    
    var houses = ["Ravenclaw", "Hufflepuff", "Slytherin", "Gryffindor"]

    @IBAction func repeatSort() {
        sortHouse()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideAll()
        sortLabel.isHidden = true

        if UserDefaults.standard.integer(forKey: "sort_executed") != 0 {
            let index = UserDefaults.standard.integer(forKey: "sort_executed")
            switch index {
            case 1:
                showGryffindor()
            case 2:
                showSlytherin()
            case 3:
                showHufflepuff()
            case 4:
                showRavenclaw()
            default:
                print(index)
            }
        } else {
            sortHouse()
        }
    }
    
    func sortHouse() {
        let index = Int.random(in: 1 ..< 5)
        switch index {
            case 1:
                showGryffindor()
                UserDefaults.standard.set(1, forKey: "sort_executed")
            case 2:
                showSlytherin()
                UserDefaults.standard.set(2, forKey: "sort_executed")
            case 3:
                showHufflepuff()
                UserDefaults.standard.set(3, forKey: "sort_executed")
            case 4:
                showRavenclaw()
                UserDefaults.standard.set(4, forKey: "sort_executed")
            default:
                print(index)
        }
    }
    
    func showGryffindor() {
        gryffindorIMG.isHidden = false
        
        ravenclawIMG.isHidden = true
        hufflepuffIMG.isHidden = true
        slytherinIMG.isHidden = true
    }
    
    func showSlytherin() {
        slytherinIMG.isHidden = false
        
        ravenclawIMG.isHidden = true
        hufflepuffIMG.isHidden = true
        gryffindorIMG.isHidden = true
    }
    
    func showHufflepuff() {
        hufflepuffIMG.isHidden = false
        
        ravenclawIMG.isHidden = true
        slytherinIMG.isHidden = true
        gryffindorIMG.isHidden = true
    }
    
    func showRavenclaw() {
        ravenclawIMG.isHidden = false
        
        hufflepuffIMG.isHidden = true
        slytherinIMG.isHidden = true
        gryffindorIMG.isHidden = true
    }
    
    func hideAll() {
        gryffindorIMG.isHidden = true
        ravenclawIMG.isHidden = true
        hufflepuffIMG.isHidden = true
        slytherinIMG.isHidden = true
    }
}
