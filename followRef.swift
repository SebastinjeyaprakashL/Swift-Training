import Foundation
import Glibc

struct User {
    var name : String
    var image : String
    
    init (name : String, image : String){
        self.name = name
        self.image = image
    }
}
var followerList = [User]()
var followingList = [User]()


func addFollower ( _ newUser : User){
    followerList.append(newUser)
}


func addFollowing (_ newUser : User) {
    followingList.append(newUser)
}

 
var newUser = User (name : "Prakash", image : "testImage_1")
addFollower(newUser)
addFollowing(newUser)

newUser = User(name : "sebastin", image : "testImage_2")
addFollower(newUser)
addFollowing(newUser)

class FollowersAPI {
    static func getUsers (id : String) -> [User] {
        return followerList
    }
}

class FollowingAPI {
    static func getUsers (id : String) -> [User] {
        return followingList
    }
}




enum Action {
    case FollowersAPI(_ currentAction: FollowersAPI.Type)
    case FollowingAPI(_ currentAction: FollowingAPI.Type)
}

 struct TableView {
    static var userList = [User]()
    let config : Action
    init (config : Action){
        self.config = config
	    
    }
    
    func getUsers ()->([User]){
        switch self.config {
            case .FollowersAPI(let currentAction):
                return currentAction.getUsers(id : "adad")
            case .FollowingAPI(let currentAction):
                return currentAction.getUsers(id : "adsa")
        }
    }
    
    func showDetail () {
		 print(getUsers())
       // print(self.config)
		
		//var a = self.config
		//var b = a()
		//print(b.getFollowers)
    }
}

 let followingTable = TableView(config : Action.FollowersAPI(FollowersAPI.self))
followingTable.showDetail()























// enum UserType {
//         case FollowingAPI (_ getUser : FollowingAPI.Type)
//         case FollowersAPI (_ getUser : FollowersAPI.Type)
//     }



//  struct TableView {

//     let config = [User]()
    
//     init (config : String){
//         //self.config = config
//         switch config{
//             case .FollowingAPI(let UserType)
//                 self.config = getUser.getUsers()
//             case .FollowersAPI(let UserType)
//                 self.config = getUser.getUsers()
//         }
// //         self.config = UserType(rawValue : config)!
// // 		var a =  String(self.config())
// // 		print(a.getFollowing)
//     }
    
//     func showDetail () {
		 
//         print(self.config)
		
// 		//var a = self.config
// 		//var b = a()
// 		//print(b.getFollowers)
//     }
// }

// let followingTable = TableView(config : Following)
// followingTable.showDetail()




import Foundation

protocol TableViewProtocol {
    var config : Action { get set}
    func showDetail()
    func getUsers ()->(users : [User], button : String)
}

struct User {
    var name : String
    var image : String
    
    init (name : String, image : String){
        self.name = name
        self.image = image
    }
}
var followerList = [User]()
var followingList = [User]()


func addFollower ( _ newUser : User){
    followerList.append(newUser)
}


func addFollowing (_ newUser : User) {
    followingList.append(newUser)
}

 
var newFollower1 = User (name : "Prakash", image : "testImage_1")
addFollower(newFollower1)

var newFollower2 = User(name : "sebastin", image : "testImage_2")
addFollower(newFollower2)


var newFollowing1 = User (name : "John", image : "testImage_3")
addFollowing(newFollowing1)

var newFollowing2 = User (name: "Peter", image: "testImage_4")
addFollowing(newFollowing2)

class FollowersAPI {
    static var button = "Remove"
    static func getUsers () -> [User] {
        return followerList
    }
}

class FollowingAPI {
    static var button = "Following"
    static func getUsers () -> [User] {
        return followingList
    }
}




enum Action {
    case FollowersAPI(_ currentAction: FollowersAPI.Type)
    case FollowingAPI(_ currentAction: FollowingAPI.Type)
}

struct TableView : TableViewProtocol {
    var config : Action
    init (config : Action){
        self.config = config
        
    }
    func showDetail () {
        let usersDetail = getUsers()
        for (index,user) in usersDetail.users.enumerated() {
            print("\(index + 1)) \(user.image) - \(user.name) - \(usersDetail.button)")
        }
        print("\n")
        
     }
    
     func getUsers ()->(users : [User], button : String){
        var currentCategoryUserArray = [User] ()
        var button : String
        switch self.config {
            case .FollowersAPI(let currentAction):
            currentCategoryUserArray = currentAction.getUsers()
                button = currentAction.button
            case .FollowingAPI(let currentAction):
            currentCategoryUserArray = currentAction.getUsers()
                button = currentAction.button
        }
        return (currentCategoryUserArray,button)
    }
}

let  followerTable  = TableView(config : Action.FollowersAPI(FollowersAPI.self))
print("Followers List")
followerTable.showDetail()

let  followingTable = TableView(config : Action.FollowingAPI(FollowingAPI.self))
print("Following List")
followingTable.showDetail()









