import UIKit
import Dispatch
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

for i in 0...10 { Thread.detachNewThread { print(i) } }

class Task {
    func start() {
        let thread = Thread(target: self, selector: #selector(task), object: nil)
        thread.start()
    }
    @objc func task() { print("executing task") }
}
Task().start()

class Task2 {
    func start() {
        let operation = BlockOperation(block: {[weak self] in
            self?.task()
            return
        })
        let queue = OperationQueue();
        queue.addOperation(operation)
    }
    
    @objc func task() {
        print("executing task2")
    }
}
Task2().start()

class Task3 {
    func start() {
        let task = Task()
        task.completionBlock = {() -> Void in print("task3 done") }
        let queue = OperationQueue()
        queue.addOperation(task)
    }
    
    class Task: Operation {
        override func main() {
            print("executing task3")
        }
    }
}
Task3().start()

let queue = DispatchQueue(label: "my queue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
queue.sync { print("in queue sync") }
print("after queue sync")
queue.async { sleep(1); print("in queue async") }
print("after queue async")

queue.asyncAfter(deadline: .now() + 1) { print("in asyncAfter")}

let workingGroup = DispatchGroup()
let workingQueue = DispatchQueue(label: "request_queue")
workingGroup.enter()
workingQueue.async {
    Thread.sleep(forTimeInterval: 1)
    print("get a data finished")
    workingGroup.leave()
}
workingGroup.enter()
workingQueue.async {
    Thread.sleep(forTimeInterval: 1)
    print("get b data finished")
    workingGroup.leave()
}

print("before waiting work group")
//workingGroup.wait()
workingGroup.notify(queue: workingQueue) { print("get a b data all finished") }
print("after waiting work group")

var seconds = 10
let timer: DispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
timer.schedule(deadline: .now(), repeating: 1.0)
timer.setEventHandler {
    seconds -= 1
    if seconds < 0 {
        timer.cancel()
    } else {
        print(seconds)
    }
}
timer.resume()


var array = Array(0...10000)
let lock = NSLock()

func getLastItem() -> Int? {
    lock.lock()
    var temp: Int? = nil
    if array.count > 0 { temp = array[array.count - 1]}
    lock.unlock()
    return temp
}

func removeLastItem() {
    lock.lock()
    array.removeLast()
    lock.unlock()
}
let q1 = DispatchQueue(label: "q1")
let q2 = DispatchQueue(label: "q2")
//q1.async { for _ in 0..<10000  { removeLastItem() } }
//q2.async { for _ in 0..<10000 { if let item = getLastItem() { print(item) } } }


let arrayQueue = DispatchQueue(label: "array queue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)


func safeGetLastItem() -> Int? {
    var temp: Int? = nil
    arrayQueue.sync { if array.count > 0 { temp = array[array.count - 1]} }
    return temp
}

func safeRemoveLastItem() {
    let workItem = DispatchWorkItem(qos: DispatchQoS.default, flags: DispatchWorkItemFlags.barrier) {
        array.removeLast()
    }
    arrayQueue.async(execute: workItem)
}

q1.async { for _ in 0..<10000  { safeRemoveLastItem() } }
q2.async { for _ in 0..<10000 { if let item = safeGetLastItem() { print(item) } } }

