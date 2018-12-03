//
//  ViewController.swift
//  Crayons
//
//  Created by Yaz Burrell on 12/3/18.
//  Copyright © 2018 Yaz Burrell. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController {
    
    var crayons = Crayon.allTheCrayons
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let CrayonDetailViewController = segue.destination as?
            CrayonDetailViewController else { fatalError("indexPath, DVC nil") }
        let crayon = crayons[indexPath.row]
        CrayonDetailViewController.crayon = crayon

    }
}

extension CrayonViewController: UITableViewDataSource {
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
        
    }
}

extension CrayonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CrayonCell", for: indexPath)
        let crayon = crayons[indexPath.row]
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = crayon.color()
        return cell
    }
    
}
