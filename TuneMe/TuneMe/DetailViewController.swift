//
//  DetailViewController.swift
//  TuneMe
//
//  Created by Rvc Ipads on 11/12/18.
//  Copyright © 2018 RockValleyCollege. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var WebSite: UIWebView!
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    


    func configureView() {
        if detailItem != nil {
        // Update the user interface for the detail item.
       // if let detail = detailItem {
          //  if let label = detailDescriptionLabel {
          //      label.text = detail.description
       //     }
     //   }
        if let myWebview = WebSite {
            if let url = URL(string: detailItem as! String) {
                let request = URLRequest(url: url)
                myWebview.scalesPageToFit = true
                myWebview.loadRequest(request)
            }
        }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

