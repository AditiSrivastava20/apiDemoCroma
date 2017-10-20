//
//  ViewController.swift
//  apiDemoTesting
//
//  Created by Croma Campus on 12/10/17.
//  Copyright © 2017 CromaCampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource { 

    @IBOutlet weak var tableView : UITableView!
    
    var tempJSON : [Dictionary<String, Any>] = []
    override func viewDidLoad() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        
        
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options:.allowFragments)
                //let user = json!["posts"] as? [[String: Any]] ?? []
                self.tempJSON = json as! [Dictionary<String, Any>]
                
                print(json)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(json)
            } catch let error as NSError {
                print(error)
            }
        }).resume()
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.tempJSON.count
        
    }
    
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell
        
        let userData = self.tempJSON[indexPath.row]
    
  //   let addressDict = userData["address"] as? NSDictionary
//    cell.emailLabel.text = addressDict!["city"] as? String
    
    let jio = userData["address"] as? NSDictionary
    
    let geodata = jio!["geo"] as? NSDictionary
    cell.emailLabel.text = geodata?["lat"] as? String
    cell.latlong.text = geodata?["lng"] as? String
    
    let phone = userData["company"] as? NSDictionary
    cell.company.text = phone!["bs"] as? String 
    
    cell.idlabel.text = userData["username"] as? String
         cell.nameLabel.text = userData["name"] as? String
        
        
        
        return cell
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

