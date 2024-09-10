# HNMarkdown
- A library support display markdown text on iOS native.

## Requirements
```
- iOS 13+
- Swift 5+
- Xcode 14+

```
## Installation

- SPM :

```ruby
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/volythat/HNMarkdown", branch: "main")
    ]
```

## Example 

- Open HNMarkdownExample for details :

```swift 

let viewMarkdown = HNMarkdown(frame:.zero)
self.addSubview(viewMarkdown)
viewMarkdown.snp.makeConstraints { make in
    make.edges.equalToSuperview()
}
let options = HNMarkdownOption(widthView: UIScreen.main.bounds.size.width - 32)
options.padding = 8 //padding for content 
options.turnOnLatex = true // support latex
//... and more options  

viewMarkdown.options = options
viewMarkdown.setUp(markdownText: text,isDebug: true)
viewMarkdown.didSelectedLink = {[weak self] url in
    // user tap on link in content
}
viewMarkdown.didSelectedImage = {[weak self] image in
    // user tap on image in content 
}
viewMarkdown.updatedHeight = { [weak self] height in
    // optional 
}

```



## Author :
- Trungnk@smartmove.com.vn

## License

HNMarkdown is available under the MIT license. See the LICENSE file for more info.

