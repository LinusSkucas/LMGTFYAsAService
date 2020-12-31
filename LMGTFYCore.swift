//
//  LMGTFYCore.swift
//  LMGTFYAsAService
//
//  Created by Linus Skucas on 12/31/20.
//

import Foundation

func returnLMGTFYURLForTerms(_ terms: String) -> String? {
    guard let terms = terms.convertedToSlug() else { return nil }
    let url = "https://lmgtfy.app/?q=\(terms)"
    return url
}
