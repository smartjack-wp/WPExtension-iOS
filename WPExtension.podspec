Pod::Spec.new do |s|
  s.name             = 'WPExtension'
  s.version          = '0.1.0'
  s.summary          = 'WP Extension Library'
  s.description      = 'Work and Play Extension is Smartjack Library' 
  s.homepage         = 'https://github.com/smartjack-wp/WPExtension-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'onemoon(SmartJack.Ltd)' => 'sopthfg@gmail.com' }
  s.source           = { :git => 'https://github.com/smartjack-wp/WPExtension-iOS.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'WPExtension/Classes/**/*'
  s.swift_version = '5.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }

#  s.dependency 'Moya', '~> 14.0'

end
