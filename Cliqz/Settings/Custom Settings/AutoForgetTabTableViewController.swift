//
//  AutoForgetTabTableViewController.swift
//  Client
//
//  Created by Mahmoud Adam on 3/13/18.
//  Copyright © 2018 Cliqz. All rights reserved.
//

import UIKit


class AutoForgetTabTableViewController: ToggleSubSettingsTableViewController {
    
    // MARK:- Abstract methods Implementation
    override func getViewName() -> String {
        return "auto_forget_tab"
    }
    
    override func getToggles() -> [Bool] {
        return [SettingsPrefs.shared.getAutoForgetTabPref()]
    }
    
    override func getToggleTitles() -> [String] {
        return [self.title ?? ""]
    }
    
    override func getSectionFooters() -> [String] {
        #if PAID
            return [NSLocalizedString("Websites which are known to contain explicit content are automatically opened in Private Tabs. Visits to such websites are therefore not saved to your history.", tableName: "Lumen", comment: "[Settings -> AutoForget Tab] toogle footer")]
        #else
            return [NSLocalizedString("Websites which are known to contain explicit content are automatically opened in Ghost Tabs. Visits to such websites are therefore not saved to your history.", tableName: "Ghostery", comment: "[Settings -> AutoForget Tab] toogle footer")]
        #endif
    }
    
    override func saveToggles(isOn: Bool, atIndex: Int) {
        SettingsPrefs.shared.updateAutoForgetTabPref(isOn)
    }
    
}
