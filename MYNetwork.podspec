Pod::Spec.new do |spec|
  spec.name                   = 'MYNetwork'
  spec.version                = '1.2.5'
  spec.summary                = "Mooseyard Networking library."
  spec.homepage               = "https://github.com/equinux/MYNetwork"
  spec.author                 = { "Jens Alfke" => "@snej" }
  spec.source                 = { :git => "https://github.com/equinux/MYNetwork.git", :tag => "v#{spec.version.to_s}" }
  spec.source_files           = "*.{h,m}", "{BLIP,Bonjour,PortMapper,TCP}/*.{h,m}"
  spec.exclude_files          = "BLIP/BLIPTest.m"
  spec.license                = 'BSD'
  spec.ios.deployment_target  = '5.0'
  spec.osx.deployment_target  = '10.7'
  spec.osx.frameworks         = ["Foundation", "CoreFoundation", "CoreServices", "Security", "SecurityInterface"]
  spec.ios.frameworks         = ["Foundation", "CoreFoundation", "Security"]
  spec.requires_arc           = true
  spec.ios.libraries          = "z", "icucore"
  spec.osx.libraries          = "z"
  spec.osx.prefix_header_file = "MYNetwork_Prefix.pch"
  spec.ios.prefix_header_file = "iPhone/MYNetwork_iPhone_Prefix.pch"

  spec.subspec "SocketRocket" do |sr|
    sr.name           = "SocketRocket"
    sr.version        = '0.3.1-beta2'
    sr.summary        = 'A conforming WebSocket (RFC 6455) client library.'
    sr.homepage       = 'https://github.com/square/SocketRocket'
    sr.authors        = 'Square'
    sr.license        = 'Apache License, Version 2.0'
    sr.source_files   = 'vendor/SocketRocket/SocketRocket/*.{h,m,c}'
    sr.requires_arc   = true
    sr.ios.frameworks = %w{CFNetwork Security}
    sr.osx.frameworks = %w{CoreServices Security}
    sr.libraries      = "icucore"
    sr.xcconfig = { "GCC_WARN_64_TO_32_BIT_CONVERSION" => "NO" }
  end

  spec.subspec "MYUtilities" do |su|
    su.name         = "MYUtilities"
    su.source_files = "vendor/MYUtilities/CollectionUtils.{h,m}",
                            "vendor/MYUtilities/ConcurrentOperation.{h,m}",
                            "vendor/MYUtilities/ExceptionUtils.{h,m}",
                            "vendor/MYUtilities/Logging.{h,m}",
                            "vendor/MYUtilities/Target.{h,m}",
                            "vendor/MYUtilities/Test.{h,m}",
                            "vendor/MYUtilities/vendor/**/*.{h,m}"
    su.requires_arc = false
    su.libraries  = "z"
  end

end
