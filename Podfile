# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'VidaliciousFakebookObjC' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for VidaliciousFakebookObjC
  pod 'BlocksKit'
  pod 'MLeaksFinder' ,:configurations => ['Debug']
  pod 'ReactiveObjC'
  pod ‘ChameleonFramework’
  pod 'FoldingCell'
  pod 'EasyPeasy'
  pod 'AFNetworking'
  # pod 'Firebase/Core'
  # pod 'Firebase/Functions'
  # pod 'GoogleAnalytics'
  #  pod 'FBAudienceNetwork'


#  s.dependency 'AFNetworking'
#  s.dependency 'ReactiveObjC'
#  s.dependency 'SDWebImage'
#  s.dependency 'SDWebImage/WebP'
#  s.dependency 'FMDB'
#  s.dependency 'Masonry'
#  s.dependency 'JSONModel'
#  s.dependency 'WMPageController'
#  s.dependency 'UITableView+FDTemplateLayoutCell'
#  s.dependency 'FDFullscreenPopGesture'
#  s.dependency 'MJExtension'
#  s.dependency 'MJRefresh'
#  s.dependency 'SVProgressHUD'
#  s.dependency 'RxWebViewController'
#  s.dependency 'CYLTabBarController'
#  s.dependency 'FDStackView'
#  s.dependency 'IQKeyboardManager'
#  s.dependency 'BlocksKit'
#  s.dependency 'IAPHelper'
#  s.dependency 'Valet'
#  s.dependency 'LXMButtonImagePosition'
#  s.dependency 'ChameleonFramework'
#  s.dependency 'FSCalendar'
#  s.dependency 'PureLayout'
#  s.dependency 'Toast'
#  s.dependency 'JHChainableAnimations'
#  s.dependency 'SCLAlertView-Objective-C'
#  s.dependency 'JKCategories'
#  s.dependency 'JVFloatLabeledTextField'
#  s.dependency 'XLForm'
#  s.dependency 'TLYShyNavBar'
#  s.dependency 'PYSearch'
#  s.dependency 'NYXImagesKit'
#  s.dependency 'TYAttributedLabel'
#  s.dependency 'MarqueeLabel'
#  s.dependency 'ZFDragableModalTransition'
#  s.dependency 'CocoaLumberjack'
#  s.dependency 'PromisesObjC'
#  s.dependency 'NSDate+TimeAgo'
#  s.dependency 'TimesSquare'
#  s.dependency 'LGSideMenuController'
#  s.dependency 'RKDropdownAlert'
#  s.dependency 'TOWebViewController'
#  s.dependency 'JVFloatingDrawer'
#  s.dependency 'LSAnimator'
#  s.dependency 'AFViewShaker'
#  s.dependency 'IGLDropDownMenu'
#  s.dependency 'HCSStarRatingView'
#  s.dependency 'TYAlertController'
#  s.dependency 'TYPagerController'
#  s.dependency 'EasyReact'
#  s.dependency 'UITextView+Placeholder'
#  s.dependency 'UIScrollView-InfiniteScroll'
#  s.dependency 'Ophiuchus'
#  s.dependency 'HTPressableButton'
#  s.dependency 'BRFlabbyTable'
#  s.dependency 'VTAcknowledgementsViewController'
#  s.dependency 'GreedoLayout'
#  s.dependency 'MBCircularProgressBar'
#  s.dependency 'FCFileManager'
#  s.dependency 'NgKeyboardTracker'
#  s.dependency 'JDStatusBarNotification'
#  s.dependency 'CWStatusBarNotification'
#  s.dependency 'RACollectionViewReorderableTripletLayout'
#  s.dependency 'SwipeTableView'
#  s.dependency 'Realm'
#  s.dependency 'BFKit'
#  s.dependency 'JLRoutes'
#  s.dependency 'HMSegmentedControl'
#  s.dependency 'DKNightVersion'
#  s.dependency 'MyLayout'
#  s.dependency 'JGProgressHUD'
#  s.dependency 'Pull-to-Refresh.Rentals-IOS'
#  s.dependency 'iOS-blur'
#  s.dependency 'ContextMenu.iOS'
#  s.dependency 'ARSegmentPager'
#  s.dependency 'DOPDropDownMenu-Enhanced'
#  s.dependency 'Expecta'
#  s.dependency 'YYKit'
#  s.dependency 'pop'


end

swift_40 = ['EasyPeasy']
swift_42 = ['FoldingCell']

post_install do |installer|
    installer.pods_project.targets.each do |target|
        swift_version = nil
        
        if swift_40.include?(target.name)
            print "set pod #{target.name} swift version to 4.0\n"
            swift_version = '4.0'
        end
        
        if swift_42.include?(target.name)
            print "set pod #{target.name} swift version to 4.2\n"
            swift_version = '4.2'
        end
        
        if swift_version
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = swift_version
            end
        end
    end
end
