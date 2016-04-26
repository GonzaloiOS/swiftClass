//
//  TableViewController.swift
//  openLibraryTable
//
//  Created by Jorge Cozain on 26/03/16.
//  Copyright © 2016 Jorge Cozain. All rights reserved.
//

import UIKit

struct Book {
    
    let title: String
    let ISBN: String
    let authors: String
    let image: UIImage?
    
    init(title: String, ISBN: String, authors: String, image:UIImage?){
        self.title = title
        self.ISBN = ISBN
        self.authors = authors
        self.image = image
    }
}

var books = [Book]()

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Books"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("goToSearch"))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let book = books[indexPath.row]
        cell.textLabel!.text = book.title
        cell.detailTextLabel!.text = "ISBN: " + book.ISBN
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let sb = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let search = sb.instantiateViewControllerWithIdentifier("search") as! ViewController
        search.book = books[indexPath.row]
        self.navigationController?.pushViewController(search, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
        
    func goToSearch() -> Void{
        let sb = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let search = sb.instantiateViewControllerWithIdentifier("search")
        self.navigationController?.pushViewController(search, animated: true)
    }
    

    
}
