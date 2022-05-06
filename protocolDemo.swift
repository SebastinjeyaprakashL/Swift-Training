import Foundation
import Glibc

protocol ThirdPartyProto {
    var name : String {get}
    var license : String {get}
}

protocol LibraryProto {
    func printAllLicenses (_ thirdParties :[ThirdPartyProto])
}

class ThirdParty : ThirdPartyProto {
    var name : String
    var license : String 

    init (name : String, license : String){
        self.name = name
        self.license = license
    }
    
    
}

class Library : LibraryProto{
    func printAllLicenses (_ thirdParties : [ThirdPartyProto]) {
        for thirdParty in thirdParties {
            print ("Name : \(thirdParty.name)  \nLicense : \(thirdParty.license)")
        }
    }
}

func addNewThirdParty (_ newParty : ThirdPartyProto){
    thirdPartyArray.append(newParty)
}

var thirdPartyArray = [ThirdPartyProto]()

let lottieLicense = "License description of Lottie"
let lottie = ThirdParty (name : "Lottie", license : lottieLicense )
addNewThirdParty(lottie)

let progressHUDSDKlicense = "License description of progress HUDSDK"
let progressHUDSDK = ThirdParty (name : "Progress HUDSDK", license : progressHUDSDKlicense )
addNewThirdParty(progressHUDSDK)

let newSDKLicense = "License description of New SDK"
let newSDK = ThirdParty (name : "New SDK", license : newSDKLicense)
addNewThirdParty(newSDK)

if !thirdPartyArray.isEmpty{
    Library().printAllLicenses(thirdPartyArray)
}
