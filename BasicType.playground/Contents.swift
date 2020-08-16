import UIKit

let error = (1, "no permission");
print("\(error.0) \(error.1)")
let exception = (code: 1, msg: "no permission");
print("\(exception.code) \(exception.msg)")
let tuple: (a: Int, b: String, c: String) = (a: 1, b: "2", c: "3");
print("\(tuple.a) \(tuple.b) \(tuple.c)")


let optStr: String? = "abc";
if optStr != nil {
    print(optStr!.count);
}
if let actualStr = optStr {
    print(actualStr.count)
}
let optStr2: String! = "abc";
print(optStr2.count);
var optStr3: Optional<String> = "abc";
print(optStr3.unsafelyUnwrapped.count)

let passage = """
let optStr2: String!\
= "abc";
print(optStr2.count);
    var optStr3: Optional<String> = "abc";
print(optStr3.unsafelyUnwrapped.count)
\\u{24}: \u{24}, \\u{2665}: \u{2665}, \\u{1f496}: \u{1f496}
"""
print(passage)
let rawStr = #"Line1\nLine2\#nLine3\nLine4"#
print(rawStr)
print(#"6 times 7 is \#(6 * 7)"#)

var s1 = "s1";
var s2 = "s" + "1"
print(s1 == s2)

for c in s1  {
    print(c)
}

var text:String  = "hello"
print(text[text.startIndex])
print(text[text.index(before: text.endIndex)])

text.insert(contentsOf: " there", at: text.endIndex)
print(text)

let range = text.index(text.endIndex, offsetBy: -6)..<text.endIndex
text.removeSubrange(range)
print(text)

let text2 = "hello world"
let index = text.firstIndex(of: ",") ?? text.endIndex
let substring = text[..<index]
print(substring)
let newText:String = String(substring);
substring == "hello"

text2.hasPrefix("hello");
text2.hasSuffix("world")
