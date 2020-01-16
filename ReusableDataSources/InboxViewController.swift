//
//  InboxViewController.swift
//  ReusableDataSources
//
//  Created by Jose Alberto Ruíz-Carrillo González on 15/01/2020.
//  Copyright © 2020 Banco Caminos. All rights reserved.
//

import UIKit

class InboxViewController: UIViewController {
    @IBOutlet weak var inboxTableView: UITableView!
    
    var messages: [Message] = []
    var message1 = Message()
    var message2 = Message()
    var message3 = Message()
    let cellIdentifier = "cell"
    var dataSource: TableViewDataSource<Message>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        message1.title = "Hola"
        message1.preview = "Hola Jose ¿Cómo estás?"
        
        message2.title = "Comida"
        message2.preview = "Hemos quedado a comer"
        
        message3.title = "Ensayo"
        message3.preview = "Hoy toca ensayo"
        messages.append(contentsOf: [message1, message2, message3])
        
        messagesDidLoad(messages)
    }
    
    func messagesDidLoad(_ messages: [Message]) {
        dataSource = .make(for: messages)
        inboxTableView.dataSource = dataSource
    }
}
