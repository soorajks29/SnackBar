//
//  ViewController.swift
//  SnackBar
//
//  Created by Sooraj on 23/02/18.
//  Copyright © 2018 Sooraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForSnackBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ToastView.showInParent(self.viewForSnackBar, "This is snackbar")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

