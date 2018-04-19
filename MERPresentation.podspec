
Pod::Spec.new do |s|
  s.name             = 'MERPresentation'
  s.version          = '0.1.0'
  s.summary          = 'MERPresentation.'
  s.description      = '一行代码完成转场动画的简单案例 MERPresentation'

  s.homepage         = 'https://github.com/Mervin1024'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '马遥' => 'mervin1024@163.com' }
  s.source           = { :git => 'https://github.com/Mervin1024/MERPresentation.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'MERPresentation/Classes/**/*'
  

  s.public_header_files = 'MERPresentation/Classes/Presentation/*.h'
end
