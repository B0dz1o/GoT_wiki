platform :ios, '8.0'

target 'GoT_wiki' do
  pod 'Realm', :podspec => 'podspecs/Realm.podspec' 
  pod 'JSONModel', '~> 1.5.1'

  target 'GoT_wikiTests' do
    inherit! :search_paths
    pod 'Realm/Headers', :podspec => 'podspecs/Realm.podspec' 
    pod 'JSONModel', '~> 1.5.1'
  end

  target 'GoT_wikiUITests' do
    inherit! :search_paths
    pod 'Realm', :podspec => 'podspecs/Realm.podspec' 
    pod 'JSONModel', '~> 1.5.1'
  end

end
