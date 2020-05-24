# ParkJuYeon
## 1st Assignment   

<br/>


## 2st Assignment   
### 1.  Caculator   
#### <버튼 둥글게 만들기>   
###### 모든 버튼을 outlet collection에 넣었을 때, for문을 통해 round설정!
```swift
@IBOutlet var Button: [UIButton]!
```

```swift
func RoundBtn(){
        
        for btn in Button{
            
            btn.layer.cornerRadius = 39
            btn.layer.masksToBounds = true
        }
   
    }
```
<hr/>   

### 2. Login화면과 ScrollView   
#### <텍스트 필드 속 글씨 없애기>   
##### 스토리보드 안 텍스트 필드를 클릭 -> 5번째 아이콘 클릭 -> Clear Button을 Appears while editing으로 변경한 후, Clear when editing begins 클릭!   
###### 단점: 텍스트 필드를 누른 이상 텍스트 필드에 쓰여 있던 기존의 텍스트는 다시 나타나지 않는다.   
<br/>  

#### <Label의 Round 생성>   
##### masksToBounds 빼먹지 않기   

```swift
self.emailLabel.layer.cornerRadius = 18
self.pwLabel.layer.cornerRadius = 18
        
emailLabel.layer.masksToBounds = true
pwLabel.layer.masksToBounds = true
```   
<br/>   


#### <버튼의 텍스트에 underline 생성하기>   
##### 글자 수에 맞게 라인의 길이가 줄어들고 늘어난다.   

```swift
extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        //NSAttributedStringKey.foregroundColor : UIColor.blue
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
```
<br/>   

#### <키보드>   
##### 텍스트 필드를 누르면 키보드가 올라가고, 화면의 빈 여백을 누르면 키보드가 내려간다.   
###### 이미지, 텍스트필드, 라벨, 버튼 등 올라가야 할 것들을 한꺼번에 view안에 담아뒀다.   
```swift
// viewDidLoad에 addKeyboardObserver() 적기!
// UITextFieldDelegate 생성하기
// viewDidLoad함수안에   
// emailTextField.delegate = self
// pwTextField.delegate = self   

extension LoginViewController: UITextFieldDelegate {
    
    private func addKeyboardObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func closeKeyboardObserver(){
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.backgroundView.transform = .init(translationX: 0, y: -80)
        })
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.backgroundView.transform = .identity
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
```    

##### 뷰컨트롤러의 생명주기: viewDidLoad -> viewWillAppear -> viewDidAppear -> viewWillDisappear -> viewDidDisappear   

```swift
override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }   
```     

#### <ScrollView화면>   
##### viewController 사이즈를 Freeform으로 변경하지 않고, ScrollView안에 있는 view크기를 늘림.   

<br/>   

## 3st Assignment   
### TableView   
#### 1. tableView cell 라인 없애기   
##### viewDidLoad에 코드 한줄만 추가해주면 된당   
```swift   
self.friendTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
```   
<br/>   

#### 2. Swipe to delete   
<img width="200" src = "https://user-images.githubusercontent.com/55732968/81819800-c1e05d00-956a-11ea-986a-c2d06782647f.png">   

##### 스와이프 후 delete를 눌러, 해당 셀을 삭제하기 위해 아래와 같은 함수를 작성한다.   

```swift   

func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if(editingStyle == .delete){
            friendInformations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
        }
    }
```


