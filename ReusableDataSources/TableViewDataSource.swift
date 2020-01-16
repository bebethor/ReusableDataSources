//
//  TableViewDataSource.swift
//  ReusableDataSources
//
//  Created by Jose Alberto Ruíz-Carrillo González on 15/01/2020.
//  Copyright © 2020 Banco Caminos. All rights reserved.
//

import UIKit

class TableViewDataSource<Model>: NSObject, UITableViewDataSource {
    // Closure que se inyecta en el inicializador
    typealias CellConfigurator = (Model, UITableViewCell) -> Void

    //Modelos que se van a cargar en la celda
    var models: [Model]

    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator

    init(models: [Model],
         reuseIdentifier: String,
         cellConfigurator: @escaping CellConfigurator) {

        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }

    // Data Source funcs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(model, cell)
        return cell
    }
}

extension TableViewDataSource where Model == Message {
    static func make(for messages: [Message], reuseIdentifier:String = "cell") -> TableViewDataSource {
        return TableViewDataSource(models: messages, reuseIdentifier: reuseIdentifier) { (message, cell) in
            cell.textLabel?.text = message.title
            cell.detailTextLabel?.text = message.preview
        }
    }
}

extension TableViewDataSource where Model == Contacts {
    static func make(for contacts: [Contacts], reuseIdentifier:String = "cell") -> TableViewDataSource {
        return TableViewDataSource(models: contacts, reuseIdentifier: reuseIdentifier) { (contact, cell) in
            cell.textLabel?.text = contact.name
            cell.detailTextLabel?.text = contact.mail
        }
    }
}
