Pod::Spec.new do |s|
s.name         = 'KryAttributesTools'
s.version      = '1.0.0'
s.summary      = 'Attributes browser for ios'
s.homepage     = 'https://github.com/youaremyall/KryAttributesTools'
s.license      = { :type => "MIT", :file => "LICENSE" }
s.authors      = {'Krystal' => '491964334@qq.com'}
s.platform     = :ios, '6.0'
s.source       = {:git => "https://github.com/youaremyall/KryAttributesTools.git", :tag => "v#{s.version}"}
s.source_files = "KryAttributesTools/KryTools/*.{h,m}"
s.requires_arc = true
end


