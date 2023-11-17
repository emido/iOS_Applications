//
//  String+Ext.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-06.
//

import Foundation
import RegexBuilder


extension String {
    var isValidEmail: Bool {
        //        let emailFformat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        //        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFformat)
        //        return emailPredicate.evaluate(with: self)
        
        let emailRegex = Regex {
            OneOrMore {
                CharacterClass(
                    .anyOf("._%+-"),
                    ("A"..."Z"),
                    ("0"..."9"),
                    ("a"..."z")
                )
            }
            "@"
            OneOrMore {
                CharacterClass(
                    .anyOf("-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
            "."
            Repeat(2...64) {
                CharacterClass(
                    ("A"..."Z"),
                    ("a"..."z")
                )
            }
        }
        return wholeMatch(of: emailRegex) != nil
        
    }
}
