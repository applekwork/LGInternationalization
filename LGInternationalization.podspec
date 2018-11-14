Pod::Spec.new do |s|
  s.name             = 'LGInternationalization'
  s.version          = '0.1.0'
  s.summary          = '国际化.'
  s.description      = <<-DESC
     国际化组件化.
                       DESC

  s.homepage         = 'https://github.com/applekwork/LGInternationalization'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LG' => 'applekwork@163.com' }
  s.source           = { :git => 'https://github.com/applekwork/LGInternationalization.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LGInternationalization/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LGInternationalization' => ['LGInternationalization/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.s.dependency 'Masonry', '= 1.1.0'
end


