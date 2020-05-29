import UIKit

class SpellsViewController: UITableViewController, UISearchBarDelegate {
    
    var spells: [Spell] = []
    var spellsBackup: [Spell] = []
    
    //@IBOutlet var searchBar: UISearchBar!
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText == "" {
//            spells = spellsBackup
//        }
//        else {
//            spells = []
//            for spell: Spell in spellsBackup {
//                if spell.spell.lowercased().contains(searchText.lowercased()) {
//                    spells.append(spell)
//                }
//            }
//        }
//        tableView.reloadData()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //searchBar.delegate = self
        
        let url = URL(string: "https://www.potterapi.com/v1/spells?key=$2a$10$nXJMfRGDAytsU/AbY45pn.zj3eWq3V.x/5Oeuj9MMN80ri37b62EK")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP Request Status Code: \(httpResponse.statusCode)")
                }          //status code check
                
                let spellList = try JSONDecoder().decode([Spell].self, from: data)
                self.spells = spellList
                self.spellsBackup = spellList
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("Error parsing data \(error)")
            }
            }.resume()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpellCell", for: indexPath)
        cell.textLabel?.text = spells[indexPath.row].spell
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SpellSegue" {
            if let destination = segue.destination as? SpellInfoViewController {
                destination.spell = spells[(tableView.indexPathForSelectedRow?.row)!]
            }
        }
    }
    
}

