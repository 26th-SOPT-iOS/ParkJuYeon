# ParkJuYeon
## 1st Assignment   
<hr/>

## 2st Assignment   
### 1. Caculator   
##### <버튼 둥글게 만들기>   
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
