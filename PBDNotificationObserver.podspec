Pod::Spec.new do |s|
  s.name     = 'PBDNotificationObserver'
  s.version  = '0.0.4'
  s.summary  = 'PBDNotificationObserver is a tests helper which can be used to assert whether a specific notification was posted.'
  s.homepage = 'https://github.com/paweldudek/PBDNotificationObserver'
  s.license  = 'MIT'
  s.author   = { 'Paweł Dudek' => 'hello@dudek.mobi' }
  s.social_media_url = 'https://twitter.com/eldudi'

  s.ios.deployment_target = '6.0'

  s.source   = { :git => 'https://github.com/paweldudek/PBDNotificationObserver.git', :tag => "#{s.version}" }
  s.source_files = 'PBDNotificationObserver/Lib/**/*.{h,m}'
  s.public_header_files = 'PBDNotificationObserver/Lib/PBDNotificationObserver.h'
  s.requires_arc = true
  s.dependency 'OCHamcrest', '>= 4.1.0'
end
