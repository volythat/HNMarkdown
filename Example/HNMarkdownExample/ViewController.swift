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
Dưới đây là một đoạn mã C để giải phương trình bậc 2 có dạng ax² + bx + c = 0. Chương trình sẽ tính toán nghiệm `<math.h>` của phương trình và in ra các nghiệm (nếu có).
```c
#include <stdio.h>
#include <math.h>

int main() {
    double a, b, c;
    double discriminant, x1, x2;

    // Nhập hệ số a, b, c từ người dùng
    printf("Nhap he so a: ");
    scanf("%lf", &a);
    printf("Nhap he so b: ");
    scanf("%lf &b);
    printf("Nhap he so c: ");
    scanf("%lf", &c);

    // Kiểm tra nếu a bằng 0, phương trình không phải là bậc 2
    if (a == 0) {
        if (b == 0) {
            if (c == 0) {
                printf("Phuong trinh co vo so nghiem.\n");
            } else {
                printf("Phuong trinh vo nghiem.\n");
            }
        } else {
            x1 = -c / b;
            printf("Phuong trinh co mot nghiem: x = %.2lf\n", x1);
        }
    } else {
        // Tính toán discriminant
        discriminant = b * b - 4 * a * c;

        // Kiểm tra discriminant để tìm nghiệm
        if (discriminant > 0) {
            x1 = (-b + sqrt(discriminant)) / (2 * a);
            x2 = (-b - sqrt(discriminant)) / (2 * a);
            printf("Phuong trinh co hai nghiem phan biet: x1 = %.2lf, x2 = %.2lf\n", x1, x2);
        } else if (discriminant == 0) {
            x1 = -b / (2 * a);
            printf("Phuong trinh co nghiem kep: x = %.2lf\n", x1);
        } else {
            printf("Phuong trinh vo nghiem.\n");
        }
    }

    return 0;
}
```

![The San Juan Mountains are beautiful!](https://cdn.24h.com.vn/upload/1-2022/images/2022-03-16/baukrysie_275278910_3174792849424333_1380029197326773703_n-1647427653-670-width1440height1800.jpg "San Juan Mountains")


### Hướng dẫn sử dụng chương trình:
1. Biên dịch mã nguồn trên bằng một trình biên dịch C, ví dụ: `gcc`:
  ```bash
   gcc -o giai_phuong_trinh_bac_2 giai_phuong_trinh_bac_2.c -lm
  ```
   2. Chạy chương trình:
  ```bash
   ./giai_phuong_trinh_bac_2
  ```
   3. Nhập các hệ số a, b, c khi được yêu cầu.

### Chú thích `<math.h>`:
- Chương trình sử dụng hàm `sqrt` từ thư viện `<math.h>` để tính căn bậc hai.
- Mã kiểm các trường hợp: phương trình bậc 2, phương trình bậc 1, và phương trình không có nghiệm.
- Nghiệm sẽ được in ra với độ chính xác 2 chữ số sau dấu thập phân.
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
            
//            cell.updatedHeight = {[weak self] in
//                print("updatedHeight")
//                self?.tbView.beginUpdates()
//                self?.tbView.endUpdates()
//            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TBChatAssistantCell2", for: indexPath) as! TBChatAssistantCell2
            
            cell.configure(message: readMeContents, speaking: false)
            
//            cell.updatedHeight = {[weak self] in
//                print("updatedHeight")
//                self?.tbView.beginUpdates()
//                self?.tbView.endUpdates()
//            }
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
