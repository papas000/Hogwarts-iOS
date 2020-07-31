import UIKit

class ViewController: UITableViewController, UISearchBarDelegate {
    
    var characters: [Character] = []
    var charactersBackup: [Character] = []
    
    @IBOutlet var searchBar: UISearchBar!
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            characters = charactersBackup
        }
        else {
            characters = []
            for character: Character in charactersBackup {
                if character.name.lowercased().contains(searchText.lowercased()) {
                    characters.append(character)
                }
            }
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        let url = URL(string: "https://hp-api.herokuapp.com/api/characters")
            
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP Request Status Code: \(httpResponse.statusCode)")
                }          //status code check
                
                var characterList = try JSONDecoder().decode([Character].self, from: data)
                
//                let path = Bundle.main.path(forResource: "gryffindor", ofType: "jpeg", inDirectory: "Assets.xcassets")
//                let urll = URL(fileURLWithPath: path!)
//                print(urll)
//
//                characterList.append(Character(name:"Emma", image:"gryffindor"))
                self.characters = characterList
                self.charactersBackup = characterList
                
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
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        cell.textLabel?.text = characters[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CharacterSegue" {
            if let destination = segue.destination as? CharacterViewController {
                destination.character = characters[(tableView.indexPathForSelectedRow?.row)!]
            }
        }
    }

}

