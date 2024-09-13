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
[pica](https://nodeca.github.io/pica/demo/),  [pica2](https://google.com.vn)

[x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}]


| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |


$$
\\frac{1}{n}\\sum_{i=1}^{n}x_i \\geq \\sqrt[n]{\\prod_{i=1}^{n}x_i}
$$

- row 1 : Outside of a dog, a `book is man's` best friend
- row 2 : Outside of a *dog*, a book is man's best friend
- ## row 3 : Outside of a dog, a book is man's best friend

1. row 1 : Outside of a dog, a `book is man's` best friend
2. row 2 : Outside of a *dog*, a book is man's best friend
3. ## row 3 : **Outside** of a dog, a book ~~is man's best friend~~

* row 1
* row 2
* row 3

*** Hello

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

Công thức nghiệm của phương trình bậc hai \\(ax^2 + bx + c = 0\\) là:

[ x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a} \\]

Trong đó:
- Nếu , phương trình có hai nghiệm phân biệt.
- Nếu , phương trình có nghiệm kép.
- Nếu , phương trình không có nghiệm thực.


Lưu ý:
- Một
- Hai
- Ba
"""
    let content = """
Hello


| STT | Tên người              | Tài sản ước tính (tỷ USD) | ACB.         |
|-----|------------------------|---------------------------|--------------|
| 1   | Jeff Bezos             | 115,3                     |              |
| 2   | Elon Musk              | 97,1                      |              |
| 3   | Bernard Arnault       | 76,1                      |              |
| 4   | Bill Gates             | 126,4                     |              |
| 5   | Mark Zuckerberg | 129,1                     |              |

Hello bottom
sau:[[\"]](https://www.qdnd.vn/xa-hoi/tin-tuc/thoi-tiet-hom-nay-12-9-mien-bac-tiep-dien-mua-to-nhung-luong-mua-se-giam-dan-793906)[[\"]](https://nongnghiep.vn/tin-thoi-tiet-hom-nay-12-9-2024-moi-nhat-trong-ca-nuoc-d399639.html)sau:[[\"]](https://www.qdnd.vn/xa-hoi/tin-tuc/thoi-tiet-hom-nay-12-9-mien-bac-tiep-dien-mua-to-nhung-luong-mua-se-giam-dan-793906)[[\"]](https://nongnghiep.vn/tin-thoi-tiet-hom-nay-12-9-2024-moi-nhat-trong-ca-nuoc-d399639.html)[[\"]](https://baohatinh.vn/du-bao-thoi-tiet-ha-tinh-hom-nay-129-mua-rao-va-dong-ngay-nang-yeu-post273494.html)[[\"]](https://baomoi.com/du-bao-thoi-tiet-hom-nay-ngay-12-9-2024-mua-dong-ca-3-mien-canh-bao-lu-khan-cap-bd3-tren-cac-song-c50151354.epi)[[\"]](https://tuoitre.vn/thoi-tiet-hom-nay-12-9-ca-nuoc-mua-mien-bac-tiep-tuc-mua-to-20240911204414623.htm)\n\n

Công thức $x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}$ được gọi là \"công thức bậc hai\" hoặc \"công thức giải phương trình bậc hai\". Đây là một công cụ toán học quan trọng để giải phương trình bậc hai trong đại số. Dưới đây là cách giải thích công thức này:\n\n- Trong công thức trên, $a$, $b$, và $c$ là các hệ số của phương trình bậc hai $ax^2 + bx + c = 0$[[\"]](https://www.quora.com/What-is-an-example-of-an-expression-in-which-I-would-use-the-formula-x-frac-b-pm-sqrt-b-2-4ac-2a)[[\"]](https://www.expii.com/t/the-quadratic-formula-defintion-examples-4539).\n- Khi giải phương trình bậc hai, chúng ta có hai giá trị của $x$ được tính bằng cách sử dụng dấu $\\pm$, nghĩa là một giá trị với dấu cộng và một giá trị với dấu trừ[[\"]](https://www.reddit.com/r/learnmath/comments/8bld5y/what_is_the_quadratic_formula_and_how_do_you_use/)[[\"]](https://www.quora.com/What-is-x-frac-b-pm-sqrt-b-2-4ac-2a-1).\n- Phần căn bậc hai $\\sqrt{b^2-4ac}$ trong công thức được gọi là \"biệt số\" (discriminant)[[\"]](https://brainly.com/question/17394965). Giá trị của biệt số này sẽ quyết định có bao nhiêu nghiệm của phương trình bậc hai và các loại nghiệm đó[[\"]](https://brainly.com/question/17394965).\n\nĐây là một công thức quan trọng và hữu ích trong giải toán học liên quan đến phương trình bậc hai.

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
        return 3
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
            self?.tbView.beginUpdates()
            self?.tbView.endUpdates()
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
