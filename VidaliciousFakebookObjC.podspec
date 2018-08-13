#
# Be sure to run `pod lib lint VidaliciousFakebookObjC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VidaliciousFakebookObjC'
  s.version          = '0.1.0'
  s.summary          = 'A short description of VidaliciousFakebookObjC.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/vidalicious/VidaliciousFakebookObjC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vidalicious' => 'vidalicious@sina.com' }
  s.source           = { :git => 'https://github.com/vidalicious/VidaliciousFakebookObjC.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'VidaliciousFakebookObjC/Classes/**/*'
  # s.resource_bundles = {
  #   'VidaliciousFakebookObjC' => ['VidaliciousFakebookObjC/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking'
  s.dependency 'ReactiveObjC'
  s.dependency 'SDWebImage'
  s.dependency 'SDWebImage/WebP'
  s.dependency 'FMDB'
  s.dependency 'Masonry'
  s.dependency 'JSONModel'
  s.dependency 'WMPageController'
  s.dependency 'UITableView+FDTemplateLayoutCell'
  s.dependency 'FDFullscreenPopGesture'
  s.dependency 'MJExtension'
  s.dependency 'MJRefresh'
  s.dependency 'SVProgressHUD'
  s.dependency 'RxWebViewController'
  s.dependency 'CYLTabBarController'
  s.dependency 'FDStackView'
  s.dependency 'IQKeyboardManager'
  s.dependency 'BlocksKit'
  s.dependency 'IAPHelper'
  s.dependency 'Valet'
  s.dependency 'LXMButtonImagePosition'
#s.dependency 'Realm'

end
