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

> Outside of a dog, a book is man's best friend. Inside of a
> dog it's too dark to read.

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

$ x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a} \\$

Trong đó:
- Nếu , phương trình có hai nghiệm phân biệt.
- Nếu , phương trình có nghiệm kép.
- Nếu , phương trình không có nghiệm thực.


Lưu ý:
- Một
- Hai
- Ba

Đây là mã C dùng để <f>giải</f> phương trình bậc 2 có dạng \\( ax^2 + bx + c = 0 \\). Mã này tính toán nghiệm của phương trình dựa trên các hệ số a, b và c.
"""
    let content = """
Đây là mã C dùng để giải phương trình bậc 2 có dạng \\( ax^2 + bx + c = 0 \\). Mã này tính toán nghiệm của phương trình dựa trên các hệ số a, b và c:

```c
#include <stdio.h>
#include <math.h>

int main() {
    double a, b, c;
    printf("Nhập vào hệ số a: ");
    scanf("%lf", &a);
    printf("Nhập vào hệ số b: ");
    scanf("%lf", &b);
    printf("Nhập vào hệ số c: ");
    scanf("%lf", &c);

    // Kiểm tra xem a có bằng 0 hay không
    if (a == 0) {
        if (b == 0) {
            if (c == 0) {
                printf("Phương trình vô số nghiệm.\n");
            } else {
                printf("Phương trình vô nghiệm.\n");
            }
        } else {
            // Phương trình bậc nhất bx + c = 0
            double x = -c / b;
            printf("Nghiệm của phương trình bậc nhất là: x = %.2lf\n", x);
        }
    } else {
        // Tính delta
        double delta = b * b - 4 * a * c;

        if (delta > 0) {
            double x1 = (-b + sqrt(delta)) / (2 * a);
            double x2 = (-b - sqrt(delta)) / (2 * a);
            printf("Phương trình có hai nghiệm phân biệt:\n");
            printf("Nghiệm thứ nhất: x1 = %.2lf\n", x1);
            printf("Nghiệm thứ hai: x2 = %.2lf\n", x2);
        } else if (delta == 0) {
            double x = -b / (2 * a);
            printf("Phương trình có nghiệm kép:\n");
            printf("Nghiệm: x = %.2lf\n", x);
        } else {
            printf("Phương trình vô nghiệm (delta < 0).\n");
        }
    }

    return 0;
}
```

### Giải thích mã:
- Chương trình bắt đầu bằng việc khai báo các biến cho hệ số `a`, `b`, và `c`.
- Sau đó đọc các hệ số này từ người dùng.
- Kiểm tra xem `a` có bằng 0 hay không để xác định xem đó có phải là phương trình bậc 2 hay không.
- Nếu `a` khác 0, tính giá trị delta (định thức) để xác định số nghiệm của phương trình:
  - Nếu delta dương, phương trình có hai nghiệm phân biệt.
  - Nếu delta bằng 0, phương trình có một nghiệm kép.
  - Nếu delta âm, phương trình không có nghiệm thực.

Bạn có thể biên dịch mã này trên bất kỳ trình biên dịch C nào và thử nghiệm với các giá trị khác nhau cho a, b và c.
"""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tbView.register(TBFeatureCodeResponseCell.self)
        self.tbView.register(TBChatAssistantCell2.self)
        
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TBFeatureCodeResponseCell", for: indexPath) as! TBFeatureCodeResponseCell
            cell.setUp(text: content)
            
            cell.updatedHeight = {[weak self] in
                print("updatedHeight")
                self?.tbView.beginUpdates()
                self?.tbView.endUpdates()
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TBChatAssistantCell2", for: indexPath) as! TBChatAssistantCell2
            
            cell.configure(message: readMeContents, speaking: false)
            
            cell.updatedHeight = {[weak self] in
                print("updatedHeight")
                self?.tbView.beginUpdates()
                self?.tbView.endUpdates()
            }
            return cell
        }
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
