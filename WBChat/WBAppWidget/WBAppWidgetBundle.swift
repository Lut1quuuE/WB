//
//  WBAppWidgetBundle.swift
//  WBAppWidget
//
//  Created by Ramazan Nazaev on 09.07.2024.
//

import WidgetKit
import SwiftUI

@main
struct WBAppWidgetBundle: WidgetBundle {
    var body: some Widget {
        WBAppWidget()
        WBAppWidgetLiveActivity()
    }
}
