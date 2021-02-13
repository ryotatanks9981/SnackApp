import UIKit
import SDWebImage

class SnackCell: UITableViewCell {
    static let id = "SnackCell"
    
    public var snack: Snack? {
        didSet {
            let url = URL(string: snack?.image ?? "")!
            snackImageView.sd_setImage(with: url)
            nameLabel.text = snack?.name
            makerLabel.text = snack?.maker
            commentLabel.text = snack?.comment
        }
    }
    
    private let snackImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(systemName: "person")
        view.clipsToBounds = true
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .black)
        return label
    }()
    
    private let makerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let views = [snackImageView, nameLabel, makerLabel, commentLabel]
        addSubViews(views: views)
        someTranslatesAutoresizingMaskIntoConstraints(views: views)
        
        let cons = [
            snackImageView.topAnchor.constraint(equalTo: topAnchor),
            snackImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            snackImageView.widthAnchor.constraint(equalToConstant: 60),
            snackImageView.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: snackImageView.trailingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            makerLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            makerLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            makerLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            commentLabel.topAnchor.constraint(equalTo: snackImageView.bottomAnchor, constant: 5),
            commentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            commentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            commentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ]
        
        NSLayoutConstraint.activate(cons)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension UIView {
    func addSubViews(views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
    func someTranslatesAutoresizingMaskIntoConstraints(views: [UIView]) {
        views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
}
