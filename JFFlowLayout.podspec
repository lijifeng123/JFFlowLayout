
Pod::Spec.new do |s|

  #名称，pod search 搜索的关键词,注意这里一定要和.podspec的名称一样,否则报错
  s.name         = "JFFlowLayout"
  #版本号
  s.version      = "1.2.0"
  #支持的pod最低版本
  s.ios.deployment_target = '9.0'
  #简介
  s.summary      = "label 布局"
  #项目主页地址
  s.homepage     = "https://github.com/lijifeng123/JFFlowLayout"
  #许可证
  s.license      = { :type => "MIT" }
  #作者
  s.author             = { "Mr.Lee" => "1229786829@qq.com" }
  #社交网址
  s.social_media_url   = "https://www.jianshu.com/u/9933d449c6cf"
  #项目的地址
  s.source       = { :git => "https://github.com/lijifeng123/JFFlowLayout.git", :tag => s.version }
  #需要包含的源文件
  s.source_files  = "JFFlowLayout/JFFlowLayout/*.{h,m}"
  s.dependency 'Masonry'
  #是否支持ARC
  s.requires_arc = true


end
