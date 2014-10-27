#require "rubygems"
require "socket"
require "net/http"
require "net/https"
require "httpclient"
require "uri"
require "json"
require "logger"
require "pathname"
$: << File.dirname(__FILE__) + "/lib"
require "utils"
require "canvas"
require "term"

#current_file = "/home/daycms/scripts/current_term.txt"
#registration_file = "/home/daycms/scripts/registration_term.txt"
p "TESTING"
begin
  next_term = Term.new("next")
  current_term = Term.new("current")
  next_registration_term = Term.new("next/2")
  next2_registration_term = Term.new("next/3")
  registration_term = current_term
  current_sprial_term = current_term
  current_sprial_term = next_term if Utils.today > Utils.registration_spiral_date(next_term.start_at)


  if Utils.today > Utils.registration_date(next_term.start_at)
    registration_term = next_term
  end

p "Current: #{current_term.name}"
p "Spiral: #{current_sprial_term.name}"
p "next next: #{next_registration_term.name}"
p "registration: #{registration_term.name}"
p "next2 registration: #{next2_registration_term.name}"
#  Utils.save_term_to_file(current_file, current_term)
#  Utils.save_term_to_file(registration_file, registration_term)

rescue Exception
  exit
end
