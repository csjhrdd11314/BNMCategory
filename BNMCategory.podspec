#
# Be sure to run `pod lib lint Categories.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BNMCategory"
  s.version          = "0.0.7"
  s.summary          = "BNMCategory."
  s.description      = <<-DESC
                        This pod contains all kinds of categories which provides a great convenience for development.
                       DESC
  s.homepage         = "http://www.baidu.com"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = "chenshuijin@baidu.com"
  s.source           = { :git => "https://github.com/csjhrdd11314/BNMCategory.git", :tag => "0.0.7" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

#*********************************BNMCategory_NSObject******************************#

    s.subspec 'BNMCategory_NSObject' do |obj|
        obj.source_files = "NSObject/**/*.{h,m}"
        obj.public_header_files = "NSObject/**/*.h"
    end

#*********************************BNMCategory_NSBundle******************************#

    s.subspec 'BNMCategory_NSBundle' do |bun|
        bun.source_files = "NSBundle/**/*.{h,m}"
        bun.public_header_files = "NSBundle/**/*.h"
    end

#*********************************BNMCategory_NSDictionary******************************#

    s.subspec 'BNMCategory_NSDictionary' do |dic|
        dic.source_files = "NSDictionary/**/*.{h,m}"
        dic.public_header_files = "NSDictionary/**/*.h"
    end

#*********************************BNMCategory_NSError******************************#

    s.subspec 'BNMCategory_NSError' do |err|
        err.source_files = "NSError/**/*.{h,m}"
        err.public_header_files = "NSError/**/*.h"
    end

#*********************************BNMCategory_UIColor******************************#

    s.subspec 'BNMCategory_UIColor' do |col|
        col.source_files = "UIColor/**/*.{h,m}"
        col.public_header_files = "UIColor/**/*.h"
    end

#*********************************BNMCategory_UIImage******************************#

    s.subspec 'BNMCategory_UIImage' do |img|
        img.source_files = "UIImage/**/*.{h,m}"
        img.public_header_files = "UIImage/**/*.h"
    end

#*********************************BNMCategory_UIView******************************#

    s.subspec 'BNMCategory_UIView' do |vie|
        vie.source_files = "UIView/**/*.{h,m}"
        vie.public_header_files = "UIView/**/*.h"
    end

#*********************************BNMCategory_NSArray******************************#

    s.subspec 'BNMCategory_NSArray' do |arr|
        arr.source_files = "NSArray/**/*.{h,m}"
        arr.public_header_files = "NSArray/**/*.h"
    end

#*********************************BNMCategory_UIImageView******************************#

    s.subspec 'BNMCategory_UIImageView' do |imgV|
        imgV.source_files = "UIImageView/**/*.{h,m}"
        imgV.public_header_files = "UIImageView/**/*.h"
    end

end


