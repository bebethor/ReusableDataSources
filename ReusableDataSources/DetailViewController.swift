//
//  DetailViewController.swift
//  ReusableDataSources
//
//  Created by Jose Alberto Ruíz-Carrillo González on 16/01/2020.
//  Copyright © 2020 Banco Caminos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var recentContacts: [Contacts] = []
    var topMessages: [Message] = []
    var dataSource: SectionedTableViewDataSource?
    var sections: [Section] = []
    
    var messages: [Message] = []
    var message1 = Message()
    var message2 = Message()
    var message3 = Message()
    
    var contact1 = Contacts(name: "Manolo", mail: "Manolo@tuvieja.com")
    var contact2 = Contacts(name: "Tonino", mail: "Tonino@tuvieja.com")
    
    var section1 = Section(title: "Contacts")
    var section2 = Section(title: "Top Messages")
    
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        message1.title = "Hola"
        message1.preview = "Hola Jose ¿Cómo estás machote?"
        
        message2.title = "Comida"
        message2.preview = "Hemos quedado a comer"
        
        message3.title = "Ensayo"
        message3.preview = "Hoy toca ensayo"
        
        topMessages.append(contentsOf: [message1, message2, message3])
        recentContacts.append(contentsOf: [contact1, contact2, contact1, contact2])
        sections.append(contentsOf: [section1, section2])
        
        let dataSource = SectionedTableViewDataSource(dataSources: [
            TableViewDataSource.make(for: recentContacts),
            TableViewDataSource.make(for: topMessages)
        ], sections: sections)
        
        self.dataSource = dataSource
        detailTableView.dataSource = dataSource
    }
}
