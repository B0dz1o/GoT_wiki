platform :ios, '8.0'
use_frameworks!
workspace 'GoT_wiki'

target 'GoT_wiki' do

  pod 'Realm', :podspec => 'podspecs/Realm.podspec' 
  pod 'JSONModel', '~> 1.5.1'

  target 'GoT_wikiTests' do
    inherit! :search_paths
    pod 'Realm/Headers', :podspec => 'podspecs/Realm.podspec' 
  end

  target 'GoT_wikiUITests' do
    inherit! :search_paths
    pod 'Realm/Headers', :podspec => 'podspecs/Realm.podspec' 
  end

  target 'IntegrationTesting' do
    inherit! :search_paths
    pod 'Realm/Headers', :podspec => 'podspecs/Realm.podspec'
  end

end
