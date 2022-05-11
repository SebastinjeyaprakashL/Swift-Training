import Foundation

protocol TableViewProtocol {
    var currentView : UserListAPI.Type { get }
    func showDetail()
}

protocol UserListAPI {
    static var button : String { get }
    static func getUsers () -> ([User])
}

struct User {
    var name : String
    var image : String
    
    init (name : String, image : String){
        self.name = name
        self.image = image
    }
    func addFollower ( _ newUser : User){
        followerList.append(newUser)
    }

    func addFollowing (_ newUser : User) {
        followingList.append(newUser)
    }
}
var followerList = [User]()
var followingList = [User]()

var newFollower1 = User (name : "Prakash", image : "testImage_1")
newFollower1.addFollower(newFollower1)

var newFollower2 = User(name : "sebastin", image : "testImage_2")
newFollower2.addFollower(newFollower2)


var newFollowing1 = User (name : "John", image : "testImage_3")
newFollowing1.addFollowing(newFollowing1)

var newFollowing2 = User (name: "Peter", image: "testImage_4")
newFollowing2.addFollowing(newFollowing2)

class FollowersListAPI : UserListAPI {
    static var button = "Remove"
    
    static func getUsers () -> [User] {
        return followerList
    }
}

class FollowingListAPI : UserListAPI {
    static var button = "Following"
    
    static func getUsers () -> [User] {
        return followingList
    }
}

struct TableView : TableViewProtocol{
    var currentView : UserListAPI.Type
    init (currentView : UserListAPI.Type){
        self.currentView = currentView
    }
    func showDetail (){
        let userList = self.currentView.getUsers()
        let button = self.currentView.button
        
        for (index,user) in userList.enumerated(){
            print("\(index + 1)) \(user.image) - \(user.name) - \(button)")
        }
        print("\n")
    }
}
let followingTable = TableView(currentView: FollowingListAPI.self)
print("Following List")
followingTable.showDetail()

let  followerTable  = TableView(currentView : FollowersListAPI.self)
print("Followers List")
followerTable.showDetail()

