Pod::Spec.new do |s|
  s.name                    = 'Realm'
  s.version                 = '2.0.0'
  s.summary                 = 'Realm is a modern data framework & database for iOS, macOS, tvOS & watchOS.'
  s.description             = <<-DESC
                              The Realm Mobile Database, for Objective-C. (If you want to use Realm from Swift, see the “RealmSwift” pod.)

                              The Realm Mobile Database is a fast, easy-to-use replacement for Core Data & SQLite. Use it with the Realm Mobile Platform for realtime, automatic data sync. Works on iOS, macOS, tvOS & watchOS. Learn more and get help at https://realm.io.
                              DESC
  s.homepage                = "https://realm.io"
  s.source                  = { :git => 'https://github.com/realm/realm-cocoa.git', :tag => "v#{s.version}", :submodules => true }
  s.author                  = { 'Realm' => 'help@realm.io' }
  s.library                 = 'c++', 'z'
  s.requires_arc            = true
  s.social_media_url        = 'https://twitter.com/realm'
  s.documentation_url       = "https://realm.io/docs/objc/#{s.version}"
  s.license                 = { :type => 'Apache 2.0', :file => 'LICENSE' }

  public_header_files       = 'include/**/RLMArray.h',
                              'include/**/RLMCollection.h',
                              'include/**/RLMConstants.h',
                              'include/**/RLMListBase.h',
                              'include/**/RLMMigration.h',
                              'include/**/RLMObject.h',
                              'include/**/RLMObjectBase.h',
                              'include/**/RLMObjectSchema.h',
                              'include/**/RLMOptionalBase.h',
                              'include/**/RLMPlatform.h',
                              'include/**/RLMProperty.h',
                              'include/**/RLMRealm.h',
                              'include/**/RLMRealmConfiguration+Sync.h',
                              'include/**/RLMRealmConfiguration.h',
                              'include/**/RLMResults.h',
                              'include/**/RLMSchema.h',
                              'include/**/RLMSyncConfiguration.h',
                              'include/**/RLMSyncCredential.h',
                              'include/**/RLMSyncManager.h',
                              'include/**/RLMSyncSession.h',
                              'include/**/RLMSyncUser.h',
                              'include/**/RLMSyncUtil.h',
                              'include/**/Realm.h',

                              # Realm.Dynamic module
                              'include/**/RLMRealm_Dynamic.h',
                              'include/**/RLMObjectBase_Dynamic.h'

                              # Realm.Private module
  private_header_files      = 'include/**/*_Private.h',
                              'include/**/RLMAccessor.h',
                              'include/**/RLMListBase.h',
                              'include/**/RLMObjectStore.h',
                              'include/**/RLMOptionalBase.h'

  source_files              = 'Realm/*.{m,mm}',
                              'Realm/ObjectStore/src/*.cpp',
                              'Realm/ObjectStore/src/impl/*.cpp',
                              'Realm/ObjectStore/src/impl/apple/*.cpp',
                              'Realm/ObjectStore/src/util/*.cpp',
                              'Realm/ObjectStore/src/util/apple/*.cpp'

  s.module_map              = 'Realm/module.modulemap'
  s.compiler_flags          = "-DREALM_HAVE_CONFIG -DREALM_COCOA_VERSION='@\"#{s.version}\"' -D__ASSERTMACROS__"
  s.prepare_command         = 'sh build.sh cocoapods-setup'
  s.source_files            = source_files + private_header_files
  s.private_header_files    = private_header_files
  s.header_mappings_dir     = 'include'
  s.pod_target_xcconfig     = { 'APPLICATION_EXTENSION_API_ONLY' => 'YES',
                                'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
                                'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Realm/include/core"',
                                'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Realm/include" "${PODS_ROOT}/Realm/include/Realm"' }
  s.preserve_paths          = %w(build.sh include)

  s.ios.deployment_target   = '7.0'
  s.ios.vendored_library    = 'core/librealm-ios.a'

  s.osx.deployment_target   = '10.9'
  s.osx.vendored_library    = 'core/librealm-macosx.a'

  s.watchos.deployment_target = '2.0'
  s.watchos.vendored_library  = 'core/librealm-watchos.a'

  s.tvos.deployment_target = '9.0'
  s.tvos.vendored_library  = 'core/librealm-tvos.a'

  s.subspec 'Headers' do |s|
    s.source_files          = public_header_files
    s.public_header_files   = public_header_files
  end
end
