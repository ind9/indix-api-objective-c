#
#  Be sure to run `pod spec lint IndixApi.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "IndixApi"
  s.version      = "0.0.4"
  s.summary      = "Indix api client for objective c"
  s.description  = "Indix is a product information marketplace"
  s.homepage     = "http://www.indix.com"
  s.license      = "MIT"
  s.author             = { "nalin" => "nalin@indix.com" }
  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.10"
  s.source       = { :git => "https://github.com/ind9/indix-api-objective-c.git", :tag => "0.0.5" }
  s.source_files  = "IndixApi", "IndixApi/**/*.{h,m}"
  s.public_header_files = "IndixApi/*.h"
  s.dependency "AFNetworking", "~> 2.5"

end
