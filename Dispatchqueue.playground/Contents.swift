import UIKit

print("A")
DispatchQueue.main.async {
    print("B")

    DispatchQueue.main.async {
        print("C")
    }
    print("D")

    DispatchQueue.global().async {
        print("E")
        DispatchQueue.main.async {
            print("F")
        }
    }
}
print("G")
