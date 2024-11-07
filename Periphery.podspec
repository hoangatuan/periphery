Pod::Spec.new do |spec|
  spec.name             = "Periphery"
  spec.version          = "2.22.0.okx"
  spec.summary          = "A tool to identify unused code in Swift projects."
  spec.homepage         = "https://github.com/hoangatuan/periphery"
  spec.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  spec.author           = { "Ian Leitch" => "ian@leitch.io" }
  spec.source           = { :http => "https://github.com/hoangatuan/ios-demos/blob/main/periphery-2.21.2.1.zip" }
  spec.preserve_paths   = '*'
end
