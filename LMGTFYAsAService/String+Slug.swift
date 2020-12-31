//
//  String+Slug.swift
//  LMGTFYAsAService
//
//  Created by Linus Skucas on 12/31/20.
//

import Foundation

/// Taken from https://www.hackingwithswift.com/example-code/strings/how-to-convert-a-string-to-a-safe-format-for-url-slugs-and-filenames
/// Thanks Paul Hudson!
extension String {
    private static let slugSafeCharacters = CharacterSet(charactersIn: "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-+")

    public func convertedToSlug() -> String? {
        if let latin = self.applyingTransform(StringTransform("Any-Latin; Latin-ASCII; Lower;"), reverse: false) {
            let urlComponents = latin.components(separatedBy: String.slugSafeCharacters.inverted)
            let result = urlComponents.filter { $0 != "" }.joined(separator: "+")

            if result.count > 0 {
                return result
            }
        }

        return nil
    }
}
