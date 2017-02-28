//
//  CollectionViewController.swift
//  GregsonRaevan_CE4
//
//  Created by Raevan Gregson on 12/6/16.
//  Copyright © 2016 Raevan Gregson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let headerIdentifier = "Header"

var animals = [[Animal](), [Animal](), [Animal]()]

var animalHeader = ["Land","Sea","Air"]

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Do any additional setup after loading the view.
        
        //add my data to my data model, an array of arrays seperated by section types
        let rabbit = Animal(name:"Rabbit",image:#imageLiteral(resourceName: "rabbit"))
        let lion = Animal(name:"Lion",image:#imageLiteral(resourceName: "lion"))
        let dog = Animal(name:"Dog",image:#imageLiteral(resourceName: "dog"))
        let giraffe = Animal(name:"Giraffe",image:#imageLiteral(resourceName: "giraffe"))
        let stag = Animal(name:"Stag",image:#imageLiteral(resourceName: "stag"))
        
        let shark = Animal(name:"Shark",image:#imageLiteral(resourceName: "shark"))
        let clownFish = Animal(name:"Clownfish",image:#imageLiteral(resourceName: "clownFish"))
        let goldFish = Animal(name:"Goldfish",image:#imageLiteral(resourceName: "goldFish"))
        let mahiMahi = Animal(name:"Mahi-Mahi",image:#imageLiteral(resourceName: "MahiMahi"))
        let dolphin = Animal(name:"Dolphin",image:#imageLiteral(resourceName: "dolphin"))
        
        let robin = Animal(name:"Robin",image:#imageLiteral(resourceName: "robin"))
        let eagle = Animal(name:"Eagle",image:#imageLiteral(resourceName: "eagle"))
        let macaw = Animal(name:"Macaw",image:#imageLiteral(resourceName: "macaw"))
        let bat = Animal(name:"Bat",image:#imageLiteral(resourceName: "bat"))
        let seagull = Animal(name:"Seagull",image:#imageLiteral(resourceName: "seagull"))
        
        animals = [[rabbit,lion,dog,giraffe,stag], [shark,clownFish,goldFish,mahiMahi,dolphin], [robin,eagle,macaw,bat,seagull]]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return animalHeader.count
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return animals[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        // Configure the cell by using the section and row to access each item in the array
        cell.name.text = animals[indexPath.section][indexPath.row].name
        cell.image.image = animals[indexPath.section][indexPath.row].image
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! CollectionReusableView
        
        //configure headers using the datamodel with the header titles inside
        header.sectionName.text = animalHeader[indexPath.section]
        
        //setup the tag for the delete buttons to match the section
        header.deleteButton.tag = indexPath.section
        
        return header
    }
    
    @IBAction func deleteSection(_ sender: UIButton) {
        
        //get tag
        let section = sender.tag
        
        //update data model
        animals.remove(at: section)
        animalHeader.remove(at: section)
        
        
        
        
        //reload data to reflect the section change
        collectionView?.performBatchUpdates({()->Void in self.collectionView?.deleteSections(NSIndexSet(index: section) as IndexSet)}, completion: {(finished)-> Void in if finished{
            self.collectionView?.reloadData()
            }})
    }
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
