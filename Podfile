# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'
use_frameworks!

workspace 'Weather'

target 'Weather' do
  # Comment the next line if you don't want to use dynamic frameworks
 

  # Pods for Weather
  pod 'SwiftLint'
  pod 'SwiftEntryKit', '~> 2.0.0'
  
  # Helper
  pod 'Alamofire', '~> 5.3'
  pod 'KeychainSwift', '~> 19.0'
  
  # UI
  pod 'TinyConstraints', '~> 4.0'
  pod 'MobilliumBuilders', '~> 1.4'
  pod 'Segmentio', '~> 4.1'

end


target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  
  #Helper
  pod 'Alamofire', '~> 5.3'
  pod 'KeychainSwift', '~> 19.0'

  end

target 'UIComponents' do
  
  project 'UIComponents/UIComponents.xcodeproj'

  # Helper
  pod 'SwiftGen', '~> 6.0'
  pod 'SwiftEntryKit', '~> 2.0.0'
  
  # UI
  pod 'TinyConstraints', '~> 4.0'
  pod 'MobilliumBuilders', '~> 1.4'
  pod 'Segmentio', '~> 4.1'
  
end

target 'Utilities' do
  
  project 'Utilities/Utilities.xcodeproj'
  
  # Helper

  
  end
