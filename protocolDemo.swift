import Foundation
import Glibc
 
protocol ThirdPartyProto {
    var name : String {get set}
    var license : String {get set}
}

class ThirdParty : ThirdPartyProto {
    var name : String
    var license : String 
    
    init (name : String, license : String){
        self.name = name
        self.license = license
    }    
}

class Library {
    func printAllLicenses (_ thirdParties : [ThirdPartyProto]) {
        for thirdParty in thirdParties {
            print ("Name : \(thirdParty.name)  \nLicense : \(thirdParty.license)")
        }
    }
}

let lottieLicense = "License description of Lottie"
let lottie = ThirdParty (name : "Lottie", license : lottieLicense )

let progressHUDSDKlicense = "License description of progress HUDSDK"
let progressHUDSDK = ThirdParty (name : "Progress HUDSDK", license : progressHUDSDKlicense )

let newSDKLicense = "License description of New SDK"
let newSDK = ThirdParty (name : "New SDK", license : newSDKLicense)

var thirdPartyArray = [ThirdPartyProto]()
thirdPartyArray.append(lottie)
thirdPartyArray.append(progressHUDSDK)
thirdPartyArray.append(newSDK)

if !thirdPartyArray.isEmpty{
    Library().printAllLicenses(thirdPartyArray)
}
