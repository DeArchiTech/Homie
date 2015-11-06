//
//  ModelManager.swift
//  Homie
//
//  Created by davix on 11/3/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation

class APIManager : NetworkOnCompleteCallBack{
    
    var backEndProtocol : APIFetchingProtocol?
    var apiOnComplete : APIonCompleteProtocol?
    var trendingCache : [String :ItemModel]?
    var usersCache : [String : UserModel]?
    var searchCache : [String :DetailItemViewModel]?
    var currentUser : UserModel?

    var lastAPICall : APICalls = APICalls.None
    
    init(){
        
        self.backEndProtocol = ParseManager(delegate: self)
        
    }
    
    func getTrending(onComplete : APIonCompleteProtocol) -> [ItemModel]?{
        
        //Network Call
        self.lastAPICall = APICalls.GetTrending
        self.apiOnComplete = onComplete
        self.backEndProtocol!.getTrendingItems()
        
        //Return what I have in the cache
        if let dict = self.trendingCache {
            
            return ([ItemModel])(dict.values)
            
        }else{
            
            return nil
        }
        
    }
    
    func getSearchResults(searchForm : SearchForm , onComplete : APIonCompleteProtocol) -> [DetailItemViewModel]?{
        
        //Network Call
        self.lastAPICall = APICalls.GetSearchResults
        self.apiOnComplete = onComplete
        self.backEndProtocol!.getSearchResults(searchForm)
        
        //Return what I have in the cache
        if let dict = self.searchCache {
            
            return ([DetailItemViewModel])(dict.values)
            
        }else{
            
            return nil
        }

    }
    
    func login(loginForm : LoginForm , onComplete : APIonCompleteProtocol) -> Bool {
        
        self.lastAPICall = APICalls.Login
        self.apiOnComplete = onComplete
        return self.backEndProtocol!.login(loginForm)
        
    }
    
    func signUp(signUpForm : SignUpForm , onComplete : APIonCompleteProtocol) -> Bool{
        
        self.lastAPICall = APICalls.SignUp
        self.apiOnComplete = onComplete
        return self.backEndProtocol!.signUp(signUpForm)
        
    }
    
    func getUsers(onComplete : APIonCompleteProtocol) -> [UserModel]?{
        
        self.lastAPICall = APICalls.GetUsers
        self.apiOnComplete = onComplete
        self.backEndProtocol!.getUsers()
        
        //Return what I have in the cache
        if let dict = self.usersCache {
            
            return ([UserModel])(dict.values)
            
        }else{
            
            return nil
        }
    }
    
    func onNetworkSuccess(nsobject : NSObject) -> Void{
        
        switch self.lastAPICall {
            
        case .GetSearchResults:
            
            //If missing users, fetch from BE
            //Return what I have in the cache
            let dict = self.usersCache
                
            if dict == nil{
                
                self.getUsers(self.apiOnComplete!)
                self.lastAPICall = APICalls.GetSearchResults
                
            }else if let _ = self.trendingCache{
                
                //If we got both values, create array and return
                let dictionary = createDetailItemViewModel(self.trendingCache!, userDict: self.usersCache!)
                self.apiOnComplete?.onNetworkSuccess([DetailItemViewModel](dictionary.values))
                
            }

            
        case .GetTrending: break
        
            
        case .SignUp: break
            
        
        case .Login: break
        
            
        case .None: break
            
        default: break
            
        }
        
    }
    
    func onNetworkFailure(statusCode : Int , message : String) -> Void{
        
        self.lastAPICall = APICalls.None
        self.apiOnComplete?.onNetworkFailure(statusCode, message: message)
        
    }
    
    func createDetailItemViewModel(itemDict : [String : ItemModel] , userDict : [String : UserModel]) -> [String : DetailItemViewModel]{
        
        var dictionary = [String : DetailItemViewModel]()
        
        for (id , item) in itemDict {
            
            dictionary[id] = DetailItemViewModel(item: item, seller: userDict[item.sellerID!]!)
            
        }
        
        self.searchCache = dictionary
        
        return self.searchCache!
    }
    
}