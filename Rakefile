# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "rubygems"
require 'motion-cocoapods'
require 'bundler'
require 'ParseModel'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ParseTest'

  if File.exists? './config/application.yaml'
    app.my_env.file = './config/application.yaml'
  else
    app.my_env.file = './config/application-default.yaml'
    PM.logger.debug "Local environment variables file not found. Please create one and save in config/application.yaml using the template located at config/application-default.yaml"
  end

  app.libs << '/usr/lib/libz.1.1.3.dylib'
  app.libs << '/usr/lib/libsqlite3.dylib'

  app.pods do
    pod 'Bolts'
    pod 'ParseUI'
    # pod 'Parse', '~> 1.4'
    # pod 'ParseFacebookUtils', '~> 1.4'
    # pod 'Facebook-iOS-SDK', '~> 3.19'
     pod 'ParseFacebookUtils'
    pod 'Facebook-iOS-SDK'
    pod 'Parse'
    # pod 'JMImageCache'
    # pod 'ionicons'
    # pod 'SVProgressHUD'
    # pod 'MMDrawerController', '~> 0.5.6'
  end

  app.frameworks += [
    'AudioToolbox',
    'CFNetwork',
    'CoreGraphics',
    'CoreLocation',
    'MobileCoreServices',
    'QuartzCore',
    'Security',
    'StoreKit',
    'SystemConfiguration']

  # in case app.deployment_target < '6.0'
  app.weak_frameworks += [
    'Accounts',
    'AdSupport',
    'Social']

  # app.vendor_project('vendor/Parse.framework', :static,
  #   :products => ['Parse'],
  #   :headers_dir => 'Headers')

  # app.vendor_project('vendor/Bolts.framework', :static,
  #   :products => ['Parse'],
  #   :headers_dir => 'Headers')

end
