//
//  LMGTFYService.swift
//  LMGTFYAsAService
//
//  Created by Linus Skucas on 12/31/20.
//

import AppKit
import Cocoa
import UserNotifications

class LMGTFYServiceProvider: NSObject {
    
    @objc func serviceCopy(_ pasteboard: NSPasteboard, userData: String, error: AutoreleasingUnsafeMutablePointer<NSString>) {
        guard let string = pasteboard.string(forType: NSPasteboard.PasteboardType.string) else {
            error.pointee = NSString(string: "Could not find text for parsing.")
            return
        }
        guard let lmgtfyURL = returnLMGTFYURLForTerms(string) else {
            error.pointee = NSString(string: "Could not convert to LMGTFY string")
            return
        }
        
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(lmgtfyURL, forType: .string)
        sendNotification()
    }
    
    private func sendNotification(title: String = "LMGTFY URL Copied!") {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { _, _ in
        }
        
        let content = UNMutableNotificationContent()
        content.title = title
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
