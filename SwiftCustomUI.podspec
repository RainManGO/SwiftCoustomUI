#
# Be sure to run `pod lib lint SwiftCustomUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftCustomUI'
  s.version          = '0.1.0'
  s.summary          = 'SwiftCustomUI 自定义UI组件'
  s.description      = <<-DESC
封装之前开发用到的UI组件，记录回顾使用。
                       DESC
  s.homepage         = 'https://github.com/776210576@qq.com/SwiftCustomUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ZY' => '776210576@qq.com' }
  s.source           = { :git => 'https://github.com/776210576@qq.com/SwiftCustomUI.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version         = '4.2'

  s.subspec 'CricleProgressView' do |ss|
      ss.source_files = 'SwiftCustomUI/Classes/CricleProgressView'
  end

  s.subspec 'CricleProgressView' do |ss|
      ss.source_files = 'SwiftCustomUI/Classes/CricleProgressView'
  end


end
