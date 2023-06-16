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
    **Website**
\nNiche graphic websites such as Artstation and Deviant Art aggregate many images of distinct genres. Using them in a prompt is a sure way to steer the image toward these styles.
\n
\nLet add artstation to the prompt.
\n
\n> Emma Watson as a powerful mysterious sorceress, casting lightning magic, detailed clothing, digital painting, hyperrealistic, fantasy, Surrealist, full body, by Stanley Artgerm Lau and Alphonse Mucha, artstation
\n
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/28.png)
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/29.png)
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/30.png)
\n
\nIt not a huge change but the images do look like what you would find on Artstation.
\n
\n**Resolution**
\nResolution represents how sharp and detailed the image is. Let add keywords highly detailed and sharp focus.
\n
\n> Emma Watson as a powerful mysterious sorceress, casting lightning magic, detailed clothing, digital painting, hyperrealistic, fantasy, Surrealist, full body, by Stanley Artgerm Lau and Alphonse Mucha, artstation, highly detailed, sharp focus
\n
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/31.png)
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/32.png)
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/33.png)
\n
\nWell, not a huge effect perhaps because the previous images are already pretty sharp and detailed. But it doesn hurt to add.
\n
\n**Additional details**
\nAdditional details are sweeteners added to modify an image. We will add sci-fi, stunningly beautiful and dystopian to add some vibe to the image.
\n
\n> Emma Watson as a powerful mysterious sorceress, casting lightning magic, detailed clothing, digital painting, hyperrealistic, fantasy, Surrealist, full body, by Stanley Artgerm Lau and Alphonse Mucha, artstation, highly detailed, sharp focus, sci-fi, stunningly beautiful, dystopian
\n
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/36.png)
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/35.png)
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/34.png)
\n
\n**Color**
\nYou can control the overall color of the image by adding color keywords. The colors you specified may appear as a tone or in objects.
\n
\nLet add some golden color to the image with the keyword iridescent gold.
\n
\n> Emma Watson as a powerful mysterious sorceress, casting lightning magic, detailed clothing, digital painting, hyperrealistic, fantasy, Surrealist, full body, by Stanley Artgerm Lau and Alphonse Mucha, artstation, highly detailed, sharp focus, sci-fi, stunningly beautiful, dystopian, iridescent gold
\n
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/38.png)
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/39.png)
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/40.png)
\n
\nThe gold comes out great!
\n
\n**Lighting**
\nAny photographer would tell you lighting is a key factor in creating successful images. Lighting keywords can have a huge effect on how the image looks. Let add cinematic lighting and dark to the prompt.
\n
\n> Emma Watson as a powerful mysterious sorceress, casting lightning magic, detailed clothing, digital painting, hyperrealistic, fantasy, Surrealist, full body, by Stanley Artgerm Lau and Alphonse Mucha, artstation, highly detailed, sharp focus, sci-fi, stunningly beautiful, dystopian, iridescent gold, cinematic lighting, dark
\n
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/41.png)
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/42.png)
\n![](http://imageai.sboomtools.net/uploads/Duyentest/Blogs/43.png)
\n
\nThis complete our example prompt.
\n
\n**Remarks**
\nAs you may have notice, the images are already pretty good with a few keywords added to the subject. When it comes to building a prompt for Stable Diffusion, often you don need to have many keywords to get good images.
\n
\nSource : [](https://stable-diffusion-art.com/)
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
        
        cell.setUp(text: content)
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
