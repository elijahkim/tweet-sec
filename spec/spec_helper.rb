require "pry"
require_relative "../password_strength_calculator"

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
