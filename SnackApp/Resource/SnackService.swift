import RxSwift

protocol SnackServiceProtocol {
    func fetchSnacks() -> Observable<Item>
}

class SnackService: SnackServiceProtocol {
    
    func test() {
        let url = URL(string: "https://www.sysbird.jp/webapi/?apikey=guest&max=10&order=r&format=json&keyword=%E3%83%88%E3%83%9E%E3%83%88")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            do {
                guard let data = data else {return}
                let decoder = try JSONDecoder().decode(Item.self, from: data)
                print("test decode: ", decoder)
            } catch {
                print("test error: \(error)")
            }
            
        })
        task.resume()
    }
    
    func fetchSnacks() -> Observable<Item> {
        Observable.create { (observer) -> Disposable in
            let url = URL(string: "https://www.sysbird.jp/webapi/?apikey=guest&max=100&order=r&format=json&keyword=%E3%83%88%E3%83%9E%E3%83%88")!
            let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
                guard let data = data else {
                    guard let error = error else {return}
                    observer.onError(error)
                    return
                }
                
                do {
                    let decoded = try JSONDecoder().decode(Item.self, from: data)
                    observer.onNext(decoded)
                    print(decoded)
                } catch {
                    observer.onError(error)
                    print(error)
                    print("here")
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
}
