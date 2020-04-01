Pod::Spec.new do |spec|
  spec.name = 'DarwinNotificationCenter'
  spec.version = '0.2.0'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage = 'https://github.com/jasonnam/DarwinNotificationCenter'
  spec.authors = { 'Jason Nam' => 'contact@jasonnam.com' }
  spec.summary = 'Inter-process notification with Darwin notification center.'
  spec.source = { :git => 'https://github.com/jasonnam/DarwinNotificationCenter.git', :tag => spec.version.to_s }
  spec.swift_version = '5.0'
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.10'
  spec.tvos.deployment_target = '9.0'
  spec.watchos.deployment_target = '2.0'
  spec.source_files = 'Sources/DarwinNotificationCenter/*.swift'
end
