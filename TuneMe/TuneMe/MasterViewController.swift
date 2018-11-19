//
//  MasterViewController.swift
//  TuneMe
//
//  Created by Rvc Ipads on 11/12/18.
//  Copyright © 2018 RockValleyCollege. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
 //   var objects = [Any]()
    var ListOfPhotos:[UIImage] = []
    var ListOfFavs:[String]?
    var FavDetails:[String]?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // navigationItem.leftBarButtonItem = editButtonItem

       // let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        //navigationItem.rightBarButtonItem = addButton
        
        ListOfPhotos = [
            UIImage(named: "womanvoice.jpg")!,
            UIImage(named: "guitar.jpg")!,
            UIImage(named: "band.jpg")!,
            UIImage(named: "symphony.jpg")!,
            UIImage(named: "whistler.jpg")!]
            
        ListOfFavs = ["Voice", "Guitar", "Band", "Symphony", "Whatever"]
        
        FavDetails = ["http://www.itunes.apple.com/us/app/onpitch-vocal-pitch-monitor/id1212118228?mt=8",
                      "http://www.apprecs.com/ios/518717030/pitchme-chromatic-tuner",
                      "http://www.JSplashApps.com/",
                      "http://www.itunes.apple.com/us/app/tonalenergy-tuner-metronome/id497716362?mt=8",
                      "http://www.sites.google.com/site/peterdeelstraapps/tuner"]
        
       // if let split = splitViewController {
         //  let controllers = split.viewControllers
        //   detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
      //  }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
  //  func insertNewObject(_ sender: Any) {
     //   objects.insert(NSDate(), at: 0)
       // let indexPath = IndexPath(row: 0, section: 0)
       // tableView.insertRows(at: [indexPath], with: .automatic)
   // }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = FavDetails![indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object as AnyObject
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.navigationItem.title = ListOfFavs![indexPath.row]
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListOfFavs!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel!.text = ListOfFavs![indexPath.row]
        let imagename:UIImage = ListOfPhotos[indexPath.row]
        cell.imageView?.image = imagename.resize(maxWidthHeight: 30)
        cell.detailTextLabel?.text = ">>"
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   //     if editingStyle == .delete {
   //         objects.remove(at: indexPath.row)
     //       tableView.deleteRows(at: [indexPath], with: .fade)
     //   } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
     //   }
   // }


}

extension UIImage {
    
    func resize(maxWidthHeight : Double)-> UIImage? {
        
        let actualHeight = Double(size.height)
        let actualWidth = Double(size.width)
        var maxWidth = 0.0
        var maxHeight = 0.0
        
        if actualWidth > actualHeight {
            maxWidth = maxWidthHeight
            let per = (100.0 * maxWidthHeight / actualWidth)
            maxHeight = (actualHeight * per) / 100.0
        }else{
            maxHeight = maxWidthHeight
            let per = (100.0 * maxWidthHeight / actualHeight)
            maxWidth = (actualWidth * per) / 100.0
        }
        
        let hasAlpha = true
        let scale: CGFloat = 0.0
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: maxWidth, height: maxHeight), !hasAlpha, scale)
        self.draw(in: CGRect(origin: .zero, size: CGSize(width: maxWidth, height: maxHeight)))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    
}

