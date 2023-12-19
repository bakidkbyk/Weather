//
//  BaseViewModel.swift
//  Weather
//
//  Created by Baki Dikbıyık on 17.12.2023.
//

protocol BaseViewModelDataSource: AnyObject { }

protocol BaseViewModelEventSource: AnyObject {
    var showActivityIndicatorView: VoidClosure? { get set }
    var hideActivityIndicatorView: VoidClosure? { get set }
    
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
    
    var showWarningToast: StringClosure? { get set }
    var showSuccessToast: StringClosure? { get set }
}

protocol BaseViewModeProtocol: BaseViewModelDataSource, BaseViewModelEventSource {}

class BaseViewModel<R: Router>: BaseViewModeProtocol {
    

    var showActivityIndicatorView: VoidClosure?
    var hideActivityIndicatorView: VoidClosure?
    
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
    
    var showWarningToast: StringClosure?
    var showSuccessToast: StringClosure?
    
    var showTryAgainButton: VoidClosure?
    var hideTryAgainButton: VoidClosure?
    
    let router: R
    let dataProvider: DataProviderProtocol
    
    init(router: R, dataProvider: DataProviderProtocol = apiDataProvider) {
        self.router = router
        self.dataProvider = dataProvider
    }
}
