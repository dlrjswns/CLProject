
import UIKit

class RootViewController: UIViewController {
    
    let selfView = RootView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(selfView)
        
        selfView.collectionView.register(PRCollectionViewCell.self, forCellWithReuseIdentifier: PRCollectionViewCell.identifier)
        selfView.collectionView.dataSource = self
        selfView.collectionView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension RootViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PRCollectionViewCell.identifier, for: indexPath) as? PRCollectionViewCell ?? PRCollectionViewCell()
        return cell
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
}
