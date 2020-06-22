# SASlideButton
SASlideButton is very light weight library for Slide Button
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/26703994/85229181-10083c00-b406-11ea-9a7b-2b66f7e69bb2.gif)

### **Getting Started**

An Sample project is included for demonstrating the functionality of SASlideButton

### **Manual Installation**
Clone the repo and drag files from SASlideButton/Source folder into your Xcode project.

### **Usage**
1.Take UIView and set parent class as SASlideButton.

2.Create object of SASlideButton

### **Code**
`saSlideButton.titleLabel.text = "Button"`

`saSlideButton.titleLabel.textColor = .blue`

`saSlideButton.tag = 0`

`saSlideButton.backgroundColor = .yellow`

`saSlideButton.spinner.backgroundColor = .white`

### **Methods**
**.resetButton()**:Moved spinner of button to initial position

**.didButtonCalled**: Gets executed after the Button swipe from left to right

 `saSlideButton.didButtonCalled = { tag in
 
            print("button pressed with tag \(tag)")
            
             }`
### **Requirements**
- iOS 11+

- Xcode 11+

### **License**

Copyright © 2020 Shabbir. All rights reserved.

