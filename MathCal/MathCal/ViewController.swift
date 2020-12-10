import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(mean2)
        view.addSubview(range2)
        view.addSubview(least2)
        view.addSubview(greatest2)
        view.addSubview(count2)
        view.addSubview(sum3)



        button.addTarget(self, action: #selector(Calculate), for: .touchUpInside)
        
        
    }
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "  Median: Result Here"
        label.frame = CGRect(x: 30, y: 370, width: 350, height: 60)
        label.backgroundColor = .red
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true

        return label
    }()
    
    private var mean2: UILabel = {
        let label = UILabel()
        label.text = "  Mean: Result Here"
        label.frame = CGRect(x: 30, y: 440, width: 350, height: 60)
        label.backgroundColor = .orange
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true

        return label
    }()
    
    private var range2: UILabel = {
        let label = UILabel()
        label.text = "  Range: Result Here"
        label.frame = CGRect(x: 30, y: 510, width: 350, height: 60)
        label.backgroundColor = .yellow
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true

        return label
    }()
    
    private var least2: UILabel = {
        let label = UILabel()
        label.text = "  Least: Result Here"
        label.frame = CGRect(x: 30, y: 580, width: 350, height: 60)
        label.backgroundColor = .green
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true

        return label
    }()
    
    private var greatest2: UILabel = {
        let label = UILabel()
        label.text = "  Greatest: Result Here"
        label.frame = CGRect(x: 30, y: 650, width: 350, height: 60)
        label.backgroundColor = .blue
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        return label
    }()
    
    private var count2: UILabel = {
        let label = UILabel()
        label.text = "  Count: Result Here"
        label.frame = CGRect(x: 30, y: 720, width: 350, height: 60)
        label.backgroundColor = .purple
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        return label
    }()
    
    private var sum3: UILabel = {
        let label = UILabel()
        label.text = "  Sum: Result Here"
        label.frame = CGRect(x: 30, y: 790, width: 350, height: 60)
        label.backgroundColor = .systemPink
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        return label
    }()
    
    private var textField: UITextField = {
        var field = UITextField()
        field.frame = CGRect(x: 30, y: 200, width: 350, height: 60)
        field.layer.cornerRadius = 12
        field.backgroundColor = .secondarySystemBackground
        field.returnKeyType = .continue
        field.placeholder = "Your list of numbers separted by a comma and a space"
        field.autocapitalizationType = .sentences
        field.setRightPaddingPoints(10)
        field.autocorrectionType = .yes
        field.returnKeyType = .continue
        field.layer.borderWidth = 1
        field.setLeftPaddingPoints(10)
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftViewMode = .always
        return field
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 30, y: 280, width: 350, height: 60)
        return button
    }()
    
    @objc func Calculate() {
        
        //MARK: for median
        let numberString = textField.text
        var array = numberString?.components(separatedBy: ", ")
        array!.sortNumerically(ascending: true)
        
        
        if (array!.count) % 2 != 0 {
            
            let i1 = (array!.count - 2) / 2
            
            if array?.count == 1 {
                label.text = "  Median: \(Double(array?.first ?? "Cant find Median") ?? 0)"
            }
            else {
                for _ in 0...i1 {
                    
                array?.removeFirst()
                array?.removeLast()
                
                }
                label.text = "  Median: \(Double(array?.first ?? "Cant find Median") ?? 0)"
            }
            
        }
        
        else if (array!.count) % 2 == 0 {
            
            
            let i1 = (array!.count / 2) - 2
            
            if array?.count == 2 {
                let first: Double = Double((array?.first ?? "IDK" as? String)!)! / 2
                let last: Double = Double((array?.last ?? "IDK" as? String)!)! / 2
                label.text = "  Median: \(first + last)"
                
                
            }
            else {
                
                for _ in 0...i1  {
                    array?.removeFirst()
                    array?.removeLast()
                    
                }
                let first: Double = Double((array?.first ?? "IDK" as? String)!)! / 2
                let last: Double = Double((array?.last ?? "IDK" as? String)!)! / 2
                label.text = "  Median: \(first + last)"
                }
                
            
        }
        
        //MARK: for mean
        let array2 = textField.text
        var array3 = array2?.components(separatedBy: ", ")
        array3?.sortNumerically(ascending: true)
        
        let arrayInt = array3?.compactMap { Int($0) }
        textField.text = array3?.joined(separator: ", ")
        let sum = (arrayInt?.sum())
        
        let mean: Double = Double(sum!) / Double(arrayInt!.count)
        mean2.text = "  Mean: \(mean)"
        
        
        //MARK: For Range
        
        let range = (arrayInt?.last!)! - (arrayInt?.first!)!
        range2.text = "  Range: \(range)"
        
        //MARK: For Least
        let least = arrayInt?.first
        least2.text = "  Least: \(least ?? 0)"
        
        //MARK: For Greatest
        let greatest = arrayInt?.last
        greatest2.text = "  Greatest: \(greatest ?? 0)"
        
        //MARK: For Count
        let count = arrayInt?.count
        count2.text = "  Count: \(count ?? 0)"
        
        //MARK: For Sum
        let sum2 = arrayInt?.sum()
        sum3.text = "  Sum: \(sum2 ?? 0)"
        
        
    
        
    }
    

}



public extension Sequence where Element: StringProtocol {
    func sortedNumerically(ascending: Bool = true) -> [Element] {
        let result: ComparisonResult = ascending ? .orderedAscending : .orderedDescending
        return sorted { $0.compare($1, options: .numeric) == result }
    }
}
public extension MutableCollection where Element: StringProtocol, Self: RandomAccessCollection {
    mutating func sortNumerically(ascending: Bool = true) {
        let result: ComparisonResult = ascending ? .orderedAscending : .orderedDescending
        return sort { $0.compare($1, options: .numeric) == result }
    }
}
extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(.zero, +) }
}
