//
//  StockDetailController.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/07.
//

import UIKit
import Pure

class StockDetailController: BaseViewController, FactoryModule {
    struct Dependency {
        let stock: Stock
        let viewModel: StockDetailViewModel
    }
    
    let selfView: StockDetailView = .init()
    let stock: Stock
    let viewModel: StockDetailViewModel
    var coordinator: MainCoordinator?
    
    required init(dependency: Dependency, payload: ()) {
        stock = dependency.stock
        viewModel = dependency.viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        enableScrollWhenKeyboardAppeared(scrollView: selfView.scrollView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeListeners()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad(symbol: stock.symbol ?? "", stock: stock)
        bind()
    }
    
    override func configureUI() {
        title = "DetailVC"
        
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        selfView.bottomView.dateInputView.textField.delegate = self
    }
    
    func bind() {
//        viewModel.$timeSeriesMonthlyAdjusted.sink { timeSeriesMonthlyAdjusted in
//            guard let timeSeriesMonthlyAdjusted = timeSeriesMonthlyAdjusted else { return }
//            print("timeSeriesMonthlyAdjusted = \(timeSeriesMonthlyAdjusted)")
//        }.store(in: &subscriber)
        
        viewModel.$monthInfo.sink { monthInfos in
            print("monthInfos = \(monthInfos)")
        }.store(in: &subscriber)
        
        viewModel.$stock.sink { [weak self] stock in
            guard let stock = stock else { return }
            self?.selfView.topView.configureUI(stock: stock)
//            self?.viewModel.configureUI(stockDetailView: self?.selfView, stock: stock)
            if let currency = stock.currency {
                self?.selfView.bottomView.configureUI(currentcy: currency)
            }
        }.store(in: &subscriber)
        
        viewModel.$errorMessage.sink { errorMessage in
            guard let errorMessage = errorMessage else { return }
            print("errorMessage = \(errorMessage)")
        }.store(in: &subscriber)
        
        viewModel.$loading.sink { [weak self] loading in
            self?.selfView.loadingView.isHidden = !loading
        }.store(in: &subscriber)
    }
}

extension StockDetailController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == selfView.bottomView.dateInputView.textField {
            coordinator?.dateInputTextFieldTapped()
            return false
        }
        return true
    }
}
