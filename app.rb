require "bundler"
Bundler.require

$:.unshift File.expand_path("../lib", __FILE__)

require_relative "lib/controllers/controller"
require_relative "lib/router"

Router.new.perform
