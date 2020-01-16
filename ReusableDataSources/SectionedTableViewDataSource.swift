//
//  SectionedTableViewDataSource.swift
//  ReusableDataSources
//
//  Created by Jose Alberto Ruíz-Carrillo González on 16/01/2020.
//  Copyright © 2020 Banco Caminos. All rights reserved.
//

import UIKit

struct Section {
  var title: String?
 
  init(title: String?) {
    self.title = title
  }
}

class SectionedTableViewDataSource: NSObject {
    private let dataSources: [UITableViewDataSource]
    private var sections: [Section] = []
    
    init(dataSources: [UITableViewDataSource], sections: [Section]) {
        self.dataSources = dataSources
        self.sections = sections
    }
}

extension SectionedTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSources.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataSource = dataSources[section]
        return dataSource.tableView(tableView, numberOfRowsInSection: 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataSource = dataSources[indexPath.section]
        let indexPath = IndexPath(row: indexPath.row, section: 0)
        return dataSource.tableView(tableView, cellForRowAt: indexPath)
    }
}
