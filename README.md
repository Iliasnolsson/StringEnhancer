# StringEnhancer

StringEnhancer is a Swift package that extends the functionality of the `String` type, making it easier to work with and manipulate strings in various ways. With StringEnhancer, you can format numeric strings, create unique strings, calculate the size of a string when rendered with a specific font, and more.

Features
--------

*   Formatting numbers with separators
*   Finding indices of characters using a closure
*   Replacing all occurrences of a character
*   Capitalizing the first letter of a string
*   Creating unique strings within a given array
*   Adding index numbers to strings
*   Subscript functionality for strings
*   Converting strings to images
*   Calculating the width, height, and size of a string using a specific font

Installation
------------

Add the StringEnhancer package to your project using the Swift Package Manager.

Examples
--------

### Subscript functionality

The subscript functionality allows you to access and manipulate parts of a string easily.


```swift
let sample = "Hello, World!"

print(sample[0]) // "H"
print(sample[1...5]) // "ello,"
print(sample[7..<13]) // "World!"
```

### Numeric formatting with separators


```swift
let number: Int = 123456789
print(number.formattedWithSeparator) // "123 456 789"
```

### Finding indices of characters


```swift
let text = "Hello, World!"
let indices = text.indices(forCharactersWhere: { $0 == "l" })
print(indices) // [2, 3, 10]
```

### Replacing all occurrences of a character


```swift
var text = "Hello, World!"
text.replaceAll(ofCharacter: "l", with: "L")
print(text) // "HeLLo, WorLd!"
```

### Capitalizing the first letter


```swift
var text = "hello, world!"
text.capitalizeFirstLetter()
print(text) // "Hello, world!"
```

### Creating unique strings


```swift
let existingStrings = ["abc", "def", "ghi"]
let uniqueString = String(uniqueIn: existingStrings)
print(uniqueString) // "jkl" or any other unique string not in the array
```

### Adding index numbers to strings


```swift
var text = "Example"
text.addIndexNumber()
print(text) // "Example 2"
```

### Converting strings to images


```swift
let text = "Hello, World!"
let font = UIFont.systemFont(ofSize: 20)
if let image = text.toImage(font: font) {
    // Use the image as needed
}
```

### Calculating the width, height, and size of a string using a specific font

```swift
let text = "Hello, World!"
let font = UIFont.systemFont(ofSize: 20)

let width = text.widthOfString(usingFont: font) // Width of the string
let height = text.heightOfString(usingFont: font) // Height of the string
let size = text.sizeOfString(usingFont: font) // CGSize containing width and height
```

License
-------

StringEnhancer is available under the MIT license. See the [LICENSE](LICENSE) file for more information.
