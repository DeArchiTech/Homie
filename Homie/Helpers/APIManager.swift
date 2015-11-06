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
    var stackOfApiCalls = Stack<APICalls>()
    
    //So if a particular network call needs additional calls
    //First push all the calls onto the stack and call them one by one
    //When we have no more items in the stack, call on complete CallBack
    
    init(){
        
        self.backEndProtocol = ParseManager(delegate: self)
        
    }
    
    func getTrending(onComplete : APIonCompleteProtocol) -> [ItemModel]?{
        
        //Network Call
        self.stackOfApiCalls.push(APICalls.GetTrending)
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
        self.stackOfApiCalls.push(APICalls.GetSearchResults)
        self.apiOnComplete = onComplete
        
        if let users = self.usersCache{
            
            self.backEndProtocol!.getSearchResults(searchForm)
        
        }else{
        
            self.stackOfApiCalls.push(APICalls.GetUsers)
            self.backEndProtocol?.getUsers()
        
        }

        //Return what I have in the cache
        if let dict = self.searchCache {
            
            return ([DetailItemViewModel])(dict.values)
            
        }else{
            
            return nil
        }

    }
    
    func login(loginForm : LoginForm , onComplete : APIonCompleteProtocol) -> Bool {
        
        self.stackOfApiCalls.push(APICalls.Login)
        self.stackOfApiCalls.push(APICalls.GetSearchResults)
        self.apiOnComplete = onComplete
        return self.backEndProtocol!.login(loginForm)
        
    }
    
    func signUp(signUpForm : SignUpForm , onComplete : APIonCompleteProtocol) -> Bool{
        
        self.stackOfApiCalls.push(APICalls.SignUp)
        self.apiOnComplete = onComplete
        return self.backEndProtocol!.signUp(signUpForm)
        
    }
    
    func getUsers(onComplete : APIonCompleteProtocol) -> [UserModel]?{
        
        self.stackOfApiCalls.push(APICalls.GetUsers)
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

        let call = self.stackOfApiCalls.pop()
        
        //If nothing left in stack, just handle the callback back to View

        if self.stackOfApiCalls.size() == 0 {
            self.handleCallBackToView(call , nsobject: nsobject)
        }
            
        //Else If there is something in the stack, do chain calling
        
        else {
            self.handleChainedApiCalling(call)
        }



        
    }
    
    func handleChainedApiCalling(apiCall : APICalls) -> Void{
        
        switch apiCall {
            
        case .GetSearchResults:
            
            self.backEndProtocol?.getUsers()
            
        case .GetTrending: break
            
        case .SignUp: break
            
        case .Login: break
            
        case .GetUsers: break
            
        case .None: break
            
        default: break
            
        }
        
    }
    
    func handleCallBackToView(apiCall : APICalls ,nsobject : NSObject) -> Void{
        
        switch apiCall {
            
        case .GetSearchResults:
            
            //If missing users, fetch from BE
            //Return what I have in the cache
            let dict = self.usersCache
            
            if dict == nil{
                
                self.getUsers(self.apiOnComplete!)
                
            }else if let _ = self.trendingCache{
                
                //If we got both values, create array and return
                let dictionary = createDetailItemViewModel(self.trendingCache!, userDict: self.usersCache!)
                self.apiOnComplete?.onNetworkSuccess([DetailItemViewModel](dictionary.values))
                
            }
            
            
        case .GetTrending:
            
            self.apiOnComplete?.onNetworkSuccess(nsobject)
            
        case .SignUp:
            
            self.apiOnComplete?.onNetworkSuccess(nsobject)
            
        case .Login:
            
            self.apiOnComplete?.onNetworkSuccess(nsobject)
            
        case .None: break
            
        default: break
            
        }
        
    }
    
    func onNetworkFailure(statusCode : Int , message : String) -> Void{
        
        //Clear Stack
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