//
//  LMGTFYCore.swift
//  LMGTFYAsAService
//
//  Created by Linus Skucas on 12/31/20.
//

import Foundation

func returnLMGTFYURLForTerms(_ terms: String) -> String? {
    guard let terms = terms.convertedToSlug() else { return nil }
    let writable = UserDefaults.standard.string(forKey: "LMGTFYURL")
    let url = "https://googlethatforyou.com?q=\(terms)"
    return url
}
