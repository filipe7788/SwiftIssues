# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'

RxSwiftVersion = '5.0'

target 'SwiftIssues' do
  use_frameworks!

# Networking Pods
  pod 'Alamofire'
  pod 'AlamofireImage'
  pod 'Moya/RxSwift', '~> 14.0'

  # UI/UX Pods  
  pod 'SnapKit',                '~> 4.2.0'
  pod 'SpringIndicator',        '~> 4.0.0'

  # Utilities
  pod 'StatefulViewController', '~> 3.0'
  pod 'RealmSwift'
  pod "RxRealm"

  # Rx Pods
  pod 'RxSwift',                "~> #{RxSwiftVersion}"
  pod 'RxCocoa',                "~> #{RxSwiftVersion}"  
  pod 'RxDataSources'
  pod 'RxSwiftExt'
  pod 'RxSwiftUtilities',       :git => 'https://github.com/RxSwiftCommunity/RxSwiftUtilities', :branch => 'master'
  pod "RxGesture"


  target 'SwiftIssuesTests' do
    inherit! :search_paths
      pod 'Nimble',         '~> 7.3.4'
      pod 'Quick',          '~> 1.3.4'
      pod 'RxNimble', subspecs: ['RxBlocking', 'RxTest']      
  end

  target 'SwiftIssuesUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
