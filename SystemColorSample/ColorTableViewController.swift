//
//  ColorTableViewController.swift
//  SystemColorSample
//
//  Created by an on 2019/11/02.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit

class ColorTableViewController: UITableViewController {

    struct ColorInfo {
        var name: String
        var color: UIColor
    }
    
    private let standardColors: Array<ColorInfo> = [
        ColorInfo(name: "systemBlue", color: UIColor.systemBlue),
        ColorInfo(name: "systemGreen", color: UIColor.systemGreen),
        ColorInfo(name: "systemIndigo", color: UIColor.systemIndigo),
        ColorInfo(name: "systemOrange", color: UIColor.systemOrange),
        ColorInfo(name: "systemPink", color: UIColor.systemPink),
        ColorInfo(name: "systemPurple", color: UIColor.systemPurple),
        ColorInfo(name: "systemRed", color: UIColor.systemRed),
        ColorInfo(name: "systemTeal", color: UIColor.systemTeal),
        ColorInfo(name: "systemYellow", color: UIColor.systemYellow),
        ColorInfo(name: "systemGray", color: UIColor.systemGray),
        ColorInfo(name: "systemGray2", color: UIColor.systemGray2),
        ColorInfo(name: "systemGray2", color: UIColor.systemGray3),
        ColorInfo(name: "systemGray4", color: UIColor.systemGray4),
        ColorInfo(name: "systemGray5", color: UIColor.systemGray5),
        ColorInfo(name: "systemGray6", color: UIColor.systemGray6),
    ];

    private let uiElementColors: Array<ColorInfo> = [
        ColorInfo(name: "label", color: UIColor.label),
        ColorInfo(name: "secondaryLabel", color: UIColor.secondaryLabel),
        ColorInfo(name: "tertiaryLabel", color: UIColor.tertiaryLabel),
        ColorInfo(name: "quaternaryLabel", color: UIColor.quaternaryLabel),
        ColorInfo(name: "systemFill", color: UIColor.systemFill),
        ColorInfo(name: "secondarySystemFill", color: UIColor.secondarySystemFill),
        ColorInfo(name: "tertiarySystemFill", color: UIColor.tertiarySystemFill),
        ColorInfo(name: "quaternarySystemFill", color: UIColor.quaternarySystemFill),
        ColorInfo(name: "placeholderText", color: UIColor.placeholderText),
        ColorInfo(name: "systemBackground", color: UIColor.systemBackground),
        ColorInfo(name: "secondarySystemBackground", color: UIColor.secondarySystemBackground),
        ColorInfo(name: "tertiarySystemBackground", color: UIColor.tertiarySystemBackground),
        ColorInfo(name: "systemGroupedBackground", color: UIColor.systemGroupedBackground),
        ColorInfo(name: "secondarySystemGroupedBackground", color: UIColor.secondarySystemGroupedBackground),
        ColorInfo(name: "tertiarySystemGroupedBackground", color: UIColor.tertiarySystemGroupedBackground),
        ColorInfo(name: "separator", color: UIColor.separator),
        ColorInfo(name: "opaqueSeparator", color: UIColor.opaqueSeparator),
        ColorInfo(name: "link", color: UIColor.link),
        ColorInfo(name: "darkText", color: UIColor.darkText),
        ColorInfo(name: "lightText", color: UIColor.lightText),
    ];
    
    private let sectionTitles = ["Standard Colors", "UI Element Colors"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "システム定義カラー一覧"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getDatasource(at: section).count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell", for: indexPath) as! ColorTableViewCell

        let colorInfo = getDatasource(at: indexPath.section)[indexPath.row]
        cell.contentView.backgroundColor = colorInfo.color
        cell.lightLabel.text = colorInfo.name
        cell.darkLabel.text = colorInfo.name

        return cell
    }

    func getDatasource(at section: Int) -> Array<ColorInfo> {
        switch section {
        case 0:
            return standardColors
        default:
            return uiElementColors
        }
    }

}
