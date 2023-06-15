//
//  ViewController.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    @IBOutlet weak var tbView : UITableView!
    
    let readMeContents = """

Bạn có thể sử dụng **AlamofireSessionManager** để cấu hình SSL ~Pinning~. Để trust certificate self-signed, bạn cần tạo 1 custom *ServerTrustPolicy* và set cho `AlamofireSessionManager`.


# The largest heading
## The second largest heading
###### The smallest heading

Ví dụ như sau (kotlin):

```
let serverTrustPolicies: [String: ServerTrustPolicy] = [
"your.server.com": .pinCertificates(
    certificates: ServerTrustPolicy.certificates(),
    validateCertificateChain: true,
    validateHost: true
),
]

let sessionManager = Alamofire.SessionManager(
configuration: URLSessionConfiguration.default,
serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
)

sessionManager.request("https://your.server.com/api").responseJSON { response in
// handle response
}

```

Swift :
```
func animateImagePicker(to view: UIView) {
let picker = UIImagePickerController()
picker.sourceType = .photoLibrary
picker.delegate = self

// Present image picker
self.present(picker, animated: true) {
    // Image picker presented, animate the selected image
    guard let image = picker.selectedImage else { return }
    
    // Create UIImageView for the selected image
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    imageView.center = picker.view.center
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.clipsToBounds = true
    
    // Add the UIImageView to the destination view
    view.addSubview(imageView)
    
    // Animate the UIImageView using spring animation
    UIView.animate(withDuration: 0.8,
                   delay: 0,
                   usingSpringWithDamping: 0.5,
                   initialSpringVelocity: 0.5,
                   options: [],
                   animations: {
                       imageView.center = view.center
                   },
                   completion: { _ in
                       // Animation complete, remove the UIImageView
                       imageView.removeFromSuperview()
                   })
}
}

```

python

```swift
import socket

# create a socket object
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# define the server's IP address and port number
server_address = ('localhost', 12345)

# connect to the server
s.connect(server_address)

# send data to the server
data = 'Hello, server!'
s.sendall(data.encode())

# receive data from the server
received_data = s.recv(1024).decode()
print('Received from server:', received_data)

# close the connection
s.close()

```

> Outside of a dog, a book is man's best friend. Inside of a
> dog it's too dark to read.

\n
[pica](https://nodeca.github.io/pica/demo/)


| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |


- row 1
- row 2
- row 3

1. row 1
2. row 2
3. row 3

* row 1
* row 2
* row 3


| STT | Tên người              | Tài sản ước tính (tỷ USD) |
|-----|------------------------|---------------------------|
| 1   | Jeff Bezos             | 115,3                     |
| 2   | Elon Musk              | 97,1                      |
| 3   | Bernard Arnault       | 76,1                      |
| 4   | Bill Gates             | 126,4                     |
| 5   | Mark Zuckerberg | 129,1                     |

"""
    let content = """
---\r\n__Advertisement :)__\r\n
[pica](https://nodeca.github.io/pica/demo/)
\r\n- __[pica](https://nodeca.github.io/pica/demo/)__ - high quality and fast image\r\n  resize in browser.\r\n- __[babelfish](https://github.com/nodeca/babelfish/)__ - developer friendly\r\n  i18n with plurals support and easy syntax.\r\n\r\nYou will like those projects!\r\n\r\n---\r\n\r\n# h1 Heading 8-)\r\n## h2 Heading\r\n### h3 Heading\r\n#### h4 Heading\r\n##### h5 Heading\r\n###### h6 Heading\r\n\r\n\r\n## Horizontal Rules\r\n\r\n___\r\n\r\n---\r\n\r\n***\r\n\r\n\r\n## Typographic replacements\r\n\r\nEnable typographer option to see result.\r\n\r\n(c) (C) (r) (R) (tm) (TM) (p) (P) +-\r\n\r\ntest.. test... test..... test?..... test!....\r\n\r\n!!!!!! ???? ,,  -- ---\r\n\r\n\"Smartypants, double quotes\" and 'single quotes'\r\n\r\n\r\n## Emphasis\r\n\r\n**This is bold text**\r\n\r\n__This is bold text__\r\n\r\n*This is italic text*\r\n\r\n_This is italic text_\r\n\r\n~~Strikethrough~~\r\n\r\n\r\n## Blockquotes\r\n\r\n\r\n> Blockquotes can also be nested...\r\n>> ...by using additional greater-than signs right next to each other...\r\n> > > ...or with spaces between arrows.\r\n\r\n\r\n## Lists\r\n\r\nUnordered\r\n\r\n+ Create a list by starting a line with `+`, `-`, or `*`\r\n+ Sub-lists are made by indenting 2 spaces:\r\n  - Marker character change forces new list start:\r\n    * Ac tristique libero volutpat at\r\n    + Facilisis in pretium nisl aliquet\r\n    - Nulla volutpat aliquam velit\r\n+ Very easy!\r\n\r\nOrdered\r\n\r\n1. Lorem ipsum dolor sit amet\r\n2. Consectetur adipiscing elit\r\n3. Integer molestie lorem at massa\r\n\r\n\r\n1. You can use sequential numbers...\r\n1. ...or keep all the numbers as `1.`\r\n\r\nStart numbering with offset:\r\n\r\n57. foo\r\n1. bar\r\n\r\n\r\n## Code\r\n\r\nInline `code`\r\n\r\nIndented code\r\n\r\n    // Some comments\r\n    line 1 of code\r\n    line 2 of code\r\n    line 3 of code\r\n\r\n\r\nBlock code \"fences\"\r\n\r\n```\r\nSample text here...\r\n```\r\n\r\nSyntax highlighting\r\n\r\n``` js\r\nvar foo = function (bar) {\r\n  return bar++;\r\n};\r\n\r\nconsole.log(foo(5));\r\n```\r\n\r\n## Tables\r\n\r\n| Option | Description |\r\n| ------ | ----------- |\r\n| data   | path to data files to supply the data that will be passed into templates. |\r\n| engine | engine to be used for processing templates. Handlebars is the default. |\r\n| ext    | extension to be used for dest files. |\r\n\r\nRight aligned columns\r\n\r\n| Option | Description |\r\n| ------:| -----------:|\r\n| data   | path to data files to supply the data that will be passed into templates. |\r\n| engine | engine to be used for processing templates. Handlebars is the default. |\r\n| ext    | extension to be used for dest files. |\r\n\r\n\r\n## Links\r\n\r\n[link text](http://dev.nodeca.com)\r\n\r\n[link with title](http://nodeca.github.io/pica/demo/ \"title text!\")\r\n\r\nAutoconverted link https://github.com/nodeca/pica (enable linkify to see)\r\n\r\n\r\n## Images\r\n\r\n![Minion](https://octodex.github.com/images/minion.png)\r\n![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg \"The Stormtroopocat\")\r\n\r\nLike links, Images also have a footnote style syntax\r\n\r\n![Alt text][id]\r\n\r\nWith a reference later in the document defining the URL location:\r\n\r\n[id]: https://octodex.github.com/images/dojocat.jpg  \"The Dojocat\"\r\n\r\n\r\n## Plugins\r\n\r\nThe killer feature of `markdown-it` is very effective support of\r\n[syntax plugins](https://www.npmjs.org/browse/keyword/markdown-it-plugin).\r\n\r\n\r\n### [Emojies](https://github.com/markdown-it/markdown-it-emoji)\r\n\r\n> Classic markup: :wink: :crush: :cry: :tear: :laughing: :yum:\r\n>\r\n> Shortcuts (emoticons): :-) :-( 8-) ;)\r\n\r\nsee [how to change output](https://github.com/markdown-it/markdown-it-emoji#change-output) with twemoji.\r\n\r\n\r\n### [Subscript](https://github.com/markdown-it/markdown-it-sub) / [Superscript](https://github.com/markdown-it/markdown-it-sup)\r\n\r\n- 19^th^\r\n- H~2~O\r\n\r\n\r\n### [ins](https://github.com/markdown-it/markdown-it-ins)\r\n\r\n++Inserted text++\r\n\r\n\r\n### [mark](https://github.com/markdown-it/markdown-it-mark)\r\n\r\n==Marked text==\r\n\r\n\r\n### [Footnotes](https://github.com/markdown-it/markdown-it-footnote)\r\n\r\nFootnote 1 link[^first].\r\n\r\nFootnote 2 link[^second].\r\n\r\nInline footnote^[Text of inline footnote] definition.\r\n\r\nDuplicated footnote reference[^second].\r\n\r\n[^first]: Footnote **can have markup**\r\n\r\n    and multiple paragraphs.\r\n\r\n[^second]: Footnote text.\r\n\r\n\r\n### [Definition lists](https://github.com/markdown-it/markdown-it-deflist)\r\n\r\nTerm 1\r\n\r\n:   Definition 1\r\nwith lazy continuation.\r\n\r\nTerm 2 with *inline markup*\r\n\r\n:   Definition 2\r\n\r\n        { some code, part of Definition 2 }\r\n\r\n    Third paragraph of definition 2.\r\n\r\n_Compact style:_\r\n\r\nTerm 1\r\n  ~ Definition 1\r\n\r\nTerm 2\r\n  ~ Definition 2a\r\n  ~ Definition 2b\r\n\r\n\r\n### [Abbreviations](https://github.com/markdown-it/markdown-it-abbr)\r\n\r\nThis is HTML abbreviation example.\r\n\r\nIt converts \"HTML\", but keep intact partial entries like \"xxxHTMLyyy\" and so on.\r\n\r\n*[HTML]: Hyper Text Markup Language\r\n\r\n### [Custom containers](https://github.com/markdown-it/markdown-it-container)\r\n\r\n::: warning\r\n*here be dragons*\r\n:::
"""
    let blog = """

    # Decorate the QR code with Stable Diffusion\r\n\r\nThis method starts with generating an image similar to the QR Code using img2img. But this is not enough to produce a valid QR Code. ControlNet is turned on during the sampling steps to imprint the QR code onto the image. Near the end of the sampling steps, ControlNet is turned off to improve the consistency of the image.\r\n\r\n### Step-by-step guide\r\n\r\nIn AUTOMATIC1111 WebUI, navigate to the Img2img page.\r\n\r\n**Step 1:** Select a checkpoint model. We will use GhostMix.\r\n\r\n**Step 2**: Enter a prompt and a negative prompt.\r\n\r\nThe prompt is quite important to your success. Some prompts blend naturally with your QR Code.\r\n\r\nWe will use the following prompt.\r\n\r\n> a cubism painting of a town with a lot of houses in the snow with a sky background, Andreas Rocha, matte painting concept art, a detailed matte painting\r\n\r\nAnd the following negative prompt.\r\n\r\n> ugly, disfigured, low quality, blurry, nsfw\r\n\r\n**Step 3**: Upload the QR code to the img2img canvas.\r\n\r\n![QR](https://i0.wp.com/stable-diffusion-art.com/wp-content/uploads/2023/06/image-48.png?w=1398&ssl=1)\r\n\r\n**Step 4**: Enter the following image-to-image settings.\r\n\r\n* Resize mode: Just resize\r\n* Sampling method: DPM++2M Karras\r\n* Sampling step: 50\r\n* Width: 768\r\n* Height: 768\r\n* CFG Scale: 7\r\n* Denoising strength: 0.75\r\n\r\n**Step 5**: Upload the QR code to ControlNet‘s image canvas.\r\n\r\n![QRCode](https://i0.wp.com/stable-diffusion-art.com/wp-content/uploads/2023/06/image-49.png?w=1404&ssl=1)\r\n\r\n**Step 6**: Enter the following ControlNet settings.\r\n\r\n* Enable: Yes\r\n* Control Type: Tile\r\n* Preprocessor: tile_resample\r\n* Model: control_xxx_tile\r\n* Control Weight: 0.87\r\n* Starting Control Step: 0.23\r\n* Ending Control Step: 0.9\r\n\r\n**Step 7**: Press Generate.\r\n![Generate](https://i0.wp.com/stable-diffusion-art.com/wp-content/uploads/2023/06/01091-2150462366.png?w=768&ssl=1)\r\n\r\n**Step 8**: Check the QR code with your phone. Make sure to check with different sizes on the screen. Some tend to have issues when they are large.\r\n\r\nYou won’t get a functional QR Code with every single image. The success rate is about one in four. Generate more images and check for the keepers.
"""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tbView.register(TBFeatureCodeResponseCell.self)
        
    }
    func safari(_ url:URL){
        let config = SFSafariViewController.Configuration()
        let vc = SFSafariViewController(url: url , configuration: config)
        self.present(vc, animated: true)
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TBFeatureCodeResponseCell", for: indexPath) as! TBFeatureCodeResponseCell
        
        cell.setUp(text: blog)
        cell.didSelectedLink = { url in
            self.safari(url)
        }
        cell.didSelectedImage = { image in
            print("selected image")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension UITableView {
    func register(_ clas : AnyClass){
        self.register(UINib(nibName: String(describing: clas), bundle: nil), forCellReuseIdentifier: String(describing: clas))
    }
    
    func dequeue(_ clas : AnyClass,_ indexPath:IndexPath)->UITableViewCell{
        return self.dequeueReusableCell(withIdentifier: String(describing: clas), for: indexPath)
    }
    func showEmpty(isShow : Bool,text:String = "Not found!"){
        if isShow {
            
            let lb = UILabel(frame: CGRect.zero)
            lb.text = text
            lb.font = UIFont.font(.HelveticaNeue, 14)
            lb.textColor = UIColor.lightGray
            lb.textAlignment = .center
            lb.numberOfLines = 0
            self.backgroundView = lb
        }else{
            self.backgroundView = nil
        }
    }
    func clearLineEmpty(){
        self.tableFooterView = UIView()
    }
    
    
}
