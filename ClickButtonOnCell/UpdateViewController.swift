//
//  UpdateViewController.swift
//  ClickButtonOnCell
//
//  Created by Rushikesh Potdar on 01/11/22.
//

import UIKit

class UpdateViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    var container : String = ""
    var indexPath : IndexPath = [0,0]
    var closure : ((String, IndexPath)->())?
    @IBOutlet weak var mytextfield: UITextField!
    @IBAction func updatebuttonTap(_ sender: UIButton) {
        guard let callback = closure else {return}
        callback(self.mytextfield.text!, self.indexPath)
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mytextfield.text = container
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
