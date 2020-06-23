import UIKit

struct Queue<T> {
    private var store = [T]()

   mutating func enqueue(_ item: T) {
    store.append(item)
}

    mutating func dequeue() -> T? {
        guard store.count > 0 else {return nil}
        return store.removeFirst()
    }
    
    func filter( _ predicate: (T) -> Bool ) -> [T] {
        var result = [T]()
        for item in store {
            if predicate(item) {
                result.append(item)
            }
        }
        
        return result
    }
}

extension Queue : CustomStringConvertible {
    var description: String {
        return "\(Array(store.reversed()))"
    }
}

var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)

print(queue)



print(queue.filter{ $0 < 20 })
