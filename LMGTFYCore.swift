//
//  LMGTFYCore.swift
//  LMGTFYAsAService
//
//  Created by Linus Skucas on 12/31/20.
//

import Foundation

func returnLMGTFYURLForTerms(_ terms: String) -> String? {
    guard let terms = terms.convertedToSlug() else { return nil }
    let host = UserDefaults.standard.string(forKey: "LMGTFYURL") ?? "https://googlethatforyou.com?q="
    return host + terms
}
