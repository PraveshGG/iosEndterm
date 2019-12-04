//
//  ProfileViewController.swift
//  200423765PraveshGiri_EndTerm
//
//  Created by Pravesh Giri on 2019-12-04.
//  Copyright © 2019 Pravesh Giri. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var email: String?
    var bio: String?
    

    
    @IBOutlet weak var nameTF: UILabel!
    @IBOutlet weak var bioTF: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTF.text = email!
        bioTF.text = bio!
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
