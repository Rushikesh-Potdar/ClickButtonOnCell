//
//  ViewController.swift
//  ClickButtonOnCell
//
//  Created by Rushikesh Potdar on 01/11/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var names = ["rushikesh", "shubham", "pratik", "chaitanya", "monesh"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {return UITableViewCell()}
        cell.nameLabel.text = names[indexPath.row]
        cell.callback = {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as? UpdateViewController else{return}
            vc.container = self.names[indexPath.row]
            vc.indexPath = indexPath
            vc.closure = { data, indPath in
                self.names[indPath.row] = data
                self.tableView.reloadRows(at: [indPath], with: .fade)
                print(self.names)
            }
            //vc.mytextfield.text = self.names[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
    
    
}

