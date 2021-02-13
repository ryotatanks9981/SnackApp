import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = SnackListViewModel()
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SnackCell.self, forCellReuseIdentifier: SnackCell.id)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
        let service = SnackService()
        service.test()
        
        navigationItem.title = "お菓子"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        
        viewModel.snackLists.flatMap { (snack) -> Observable<[Snack]> in
            return Observable.create { (observer) -> Disposable in
                var snacks = [Snack]()
                snack.item.forEach { (item) in
                    snacks.append(item)
                }
                observer.onNext(snacks)
                return Disposables.create()
            }
        }
        .bind(to: tableView.rx.items(cellIdentifier: SnackCell.id, cellType: SnackCell.self)) { index, snack, cell in
            cell.snack = snack
        }.disposed(by: bag)
        
    }


}
