//
//  ViewController.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//

import UIKit
import SafariServices
import Markdown

class ViewController: UIViewController {
    
    @IBOutlet weak var tbView : UITableView!
    
    let readMeContents = """
----

Bạn có thể sử dụng **AlamofireSessionManager** để cấu hình SSL ~Pinning~. Để trust certificate self-signed, bạn cần tạo 1 custom *ServerTrustPolicy* và set cho `AlamofireSessionManager`.

Bạn có thể sử dụng [x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}] Để trust certificate self-signed.

----

# The largest heading
## The second largest heading
###### The smallest heading

**** Ví dụ như sau (kotlin):

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

[x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}]


| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |


$$
\\frac{1}{n}\\sum_{i=1}^{n}x_i \\geq \\sqrt[n]{\\prod_{i=1}^{n}x_i}
$$


- row 1
- row 2
- row 3

1. row 1
2. row 2
3. row 3

* row 1
* row 2
* row 3

$
x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}
$

| STT | Tên người              | Tài sản ước tính (tỷ USD) | ACB.         |
|-----|------------------------|---------------------------|--------------|
| 1   | Jeff Bezos             | 115,3                     |              |
| 2   | Elon Musk              | 97,1                      |              |
| 3   | Bernard Arnault       | 76,1                      |              |
| 4   | Bill Gates             | 126,4                     |              |
| 5   | Mark Zuckerberg | 129,1                     |              |

Lưu ý:
- Một
- Hai
- Ba
"""
    let content = """
    \n**What is ArtJourney - AI Art Generator?**
    \nArtJourney - AI Art Generator  is a latent diffusion model for generating AI images. The images can be photorealistic, like those captured by a camera, or in an artistic style as if produced by a professional artist.

    \n
    \n

    \n
    > asd fasd fsad fsdf sd fsfd1
    > asd fasd fsad fsdf sd fsfd2

    \n
    \n**How to use ArtJourney - AI Art Generator?**
    \nYou need to give it a prompt that describes an image.
    \nFor example: gingerbread house, diorama, in focus, white background, toast , crunch cereal
    \nArtJourney - AI Art Generator turns this prompt into images like the ones below.
    
    **** Hello
    \n
    \n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/117.png)
    \n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/118.png)
    \n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/119.png)
    \n
    \n*Recompiled source : https://stable-diffusion-art.com/*
"""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tbView.register(TBFeatureCodeResponseCell.self)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        if let cell = tbView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TBFeatureCodeResponseCell {
//            cell.release()
//        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tbView.reloadData()
    }
    deinit {
        print("deinit ViewController")
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
        
        cell.setUp(text: readMeContents)
        cell.didSelectedLink = {[weak self] url in
            self?.safari(url)
        }
        cell.didSelectedImage = {[weak self] image in
            print("selected image")
        }
        cell.updatedHeight = {[weak self] in
            print("updatedHeight")
            self?.tbView.reloadData()
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
    
}
