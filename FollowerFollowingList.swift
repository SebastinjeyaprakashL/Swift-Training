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
