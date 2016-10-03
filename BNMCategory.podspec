#
# Be sure to run `pod lib lint Categories.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BNMCategory"
  s.version          = "0.0.6"
  s.summary          = "BNMCategory."
  s.description      = <<-DESC
                        This pod contains all kinds of categories which provides a great convenience for development.
                       DESC
  s.homepage         = "http://www.baidu.com"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = "chenshuijin@baidu.com"
  s.source           = { :git => "https://github.com/csjhrdd11314/BNMCategory.git", :tag => "0.0.6" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = "NSObject/**/*.{h,m}"

#*********************************BNMCategory_NSBundle******************************#

    s.subspec 'BNMCategory_NSBundle' do |arr|
        arr.source_files = "NSBundle/**/*.{h,m}"
        arr.public_header_files = "NSBundle/**/*.h"
    end

#*********************************BNMCategory_NSDictionary******************************#

    s.subspec 'BNMCategory_NSString' do |dic|
        dic.source_files = "NSString/**/*.{h,m}"
        dic.public_header_files = "NSString/**/*.h"
    end

end


