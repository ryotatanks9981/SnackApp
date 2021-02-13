import RxCocoa
import RxSwift

protocol SnackListViewModelInputs {
    var searchText: BehaviorRelay<String> { get }
}

protocol SnackListViewModelOutputs {
    var snackLists: Observable<Item> { get }
}

protocol SnackListViewModelType {
    var inputs: SnackListViewModelInputs { get }
    var outputs: SnackListViewModelOutputs { get }
}

final class SnackListViewModel: SnackListViewModelType, SnackListViewModelOutputs, SnackListViewModelInputs {
    var inputs: SnackListViewModelInputs { self }
    var outputs: SnackListViewModelOutputs { self }
    
    var searchText = BehaviorRelay(value: "")
    var snackLists: Observable<Item>
    
    private let snackService: SnackService
    private let bag = DisposeBag()
    
    init() {
        snackService = SnackService()
        
        snackLists = snackService.fetchSnacks()
    }
}
