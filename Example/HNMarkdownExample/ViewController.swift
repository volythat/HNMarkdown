//
//  ViewController.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//

import UIKit

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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tbView.register(TBFeatureCodeResponseCell.self)
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TBFeatureCodeResponseCell", for: indexPath) as! TBFeatureCodeResponseCell
        
        cell.setUp(text: readMeContents)
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
