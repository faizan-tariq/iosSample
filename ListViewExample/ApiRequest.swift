import Foundation
import CoreData

struct ApiRequest {
    let resourceURL: URL;
    
    init(){
        let path = "http://spring-get-players.herokuapp.com/players"
        guard let url = URL(string: path) else {fatalError()}
        self.resourceURL = url
    }
    
    func get(controller: ViewController){
        let session = URLSession.shared
        session.dataTask(with: resourceURL) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let list = try decoder.decode([DataModel].self, from: data)
                    for item in list {
                        controller.self.save(name: item.name!)
                    }
//                    DispatchQueue.main.async {
//                        controller.self.tableView.reloadData()
//                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
}
