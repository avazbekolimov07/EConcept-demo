//
//  ProfileViewController.swift
//  EConcept
//
//  Created by AvazbekOS on 21/12/22.
//

import UIKit

class ProfileViewController: BaseViewController {

    private lazy var tLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 35)
        label.text = "UI not given in Figma!"
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(tLabel)
        tLabel.fillSuperview()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.backgroundColor = .clear
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
