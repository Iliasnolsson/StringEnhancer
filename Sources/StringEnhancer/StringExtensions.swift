
import Foundation
import QuartzCore

public extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}

public extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}

public extension String {
    
    func indicies(forCharactersWhere closure: ((Character) -> (Bool))) -> [String.Index] {
        var foundIndicies = [String.Index]()
        for index in self.indices {
            let character = self[index]
            if closure(character) {
                foundIndicies.append(index)
            }
        }
        return foundIndicies
    }
    
    mutating func replaceAll(ofCharacter character: Character, with newCharacter: Character) {
        self = replacingOccurrences(of: String(character), with: String(newCharacter), options: NSString.CompareOptions.literal, range: nil)
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    init(uniqueIn strings: [String]) {
        var builtString = ""
        while strings.contains(builtString) || builtString == "" {
            for char in "abcdefghijklmnopqrstuvwxyz123456789" {
                let charString = "\(builtString)\(char)"
                if !strings.contains(charString) {
                    self.init()
                    self = charString
                    return
                }
            }
            let longerStrings = strings.filter({$0.count >= builtString.count})
            let chars = longerStrings.map({$0[builtString.count]}).filter({$0 != ""})
            
            let uniqueChars = Array(Set(chars))
            
            let amountOfEach = uniqueChars.map({a in (a, chars.filter({$0 == a}).count)})
            let leastCommonChar = amountOfEach.min(by: {a, b in a.1 < b.1})?.0 ?? "a"
            
            builtString = "\(builtString)\(leastCommonChar)"
        }
        self.init()
        self = builtString
    }
    
    mutating func addIndexNumber() {
        if let fromIndex = self.lastIndex(of: " ") {
            let stringAfterIndex = self.substring(fromIndex: fromIndex.utf16Offset(in: self) + 1)
            if let number = Int(stringAfterIndex) {
                self = String(self.dropLast(stringAfterIndex.count + 1)) + " " + String(number + 1)
            }
        }
        self = self + " \(2)"
    }
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
}

public extension String {
    
    
    var cgColor: CGColor {
        let (red, green, blue) = hexColorComponents()
        
        if #available(iOS 13.0, tvOS 13.0, *) {
            return CGColor(red: red, green: green, blue: blue, alpha: 1)
        } else {
            return CGColor(
                colorSpace: CGColorSpaceCreateDeviceRGB(),
                components: [red, green, blue])!
        }
    }
    
    func hexColorComponents() -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
        var cString:String = trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return (red: 0, green: 0, blue: 0)
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return (red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0)
    }
    
}


extension String: Error {
    
}

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}


public extension String {
    
    static func description(forTitleToMessageIn dict: [String : String], sameRow: Bool = false) -> String {
        var description = ""
        description.append("\r\n")
        if sameRow {
            for (title, message) in dict {
                description.append(title + message)
            }
        } else {
            for (title, message) in dict {
                description.append(title)
                description.append(message)
            }
        }
        return description
    }
    
    
}

