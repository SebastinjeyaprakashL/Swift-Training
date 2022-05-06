import Foundation
import Glibc

protocol ThirdPartyLicenseProto {
    var name : String {get}
    var license : String {get}
    var releasedYear : Int {get}
}

protocol LibraryProto {
    func printAllLicenses (_ thirdParties :[ThirdPartyLicenseProto])
}

class Lottie : ThirdPartyLicenseProto{
    let name = "Lottie"
    let license = "License description of Lottie"
    let releasedYear = 2019
}

class ProgressHUDSDK : ThirdPartyLicenseProto{
    let name = "Progress HUDSDK"
    let license = "License description of progress HUDSDK"
    let releasedYear = 2009
}

class NewSDK : ThirdPartyLicenseProto {
    let name = "New SDK"
    let license = "License description of New SDK"
    let releasedYear = 2010

}

class Library : LibraryProto{
    func printAllLicenses (_ thirdParties : [ThirdPartyLicenseProto]) {
        for thirdParty in thirdParties {
            print ("Name : \(thirdParty.name)  \nLicense : \(thirdParty.license) \nReleased On: \(thirdParty.releasedYear) \n\n")
        }
    }
}

var thirdPartyArray : [ThirdPartyLicenseProto] = [ Lottie(), ProgressHUDSDK(), NewSDK()]

if !thirdPartyArray.isEmpty{
    Library().printAllLicenses(thirdPartyArray)
}
