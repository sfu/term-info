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

current_file = "/home/daycms/scripts/current_term.txt"
current_spiral_file = "/home/daycms/scripts/spiral_term.txt"
registration_file = "/home/daycms/scripts/registration_term.txt"
next_registration_file = "/home/daycms/scripts/next_registration_term.txt"
next2_registration_file = "/home/daycms/scripts/next2_registration_term.txt"

begin
  next_term = Term.new("next")
  next_registration_term = Term.new("next/2")
  next2_registration_term = Term.new("next/3")
  current_term = Term.new("current")
  current_sprial_term = current_term
  current_sprial_term = next_term if Utils.today >= Utils.registration_spiral_date(next_term.start_at)

  if Utils.today >= Utils.registration_date(next_term.start_at)
    registration_term = next_term
  else
    registration_term = current_term
    next_registration_term = Term.new("next")
    next2_registration_term = Term.new("next/2")
  end

  Utils.save_term_to_file(current_file, current_term)
  Utils.save_term_to_file(current_spiral_file, current_sprial_term)
  Utils.save_term_to_file(registration_file, registration_term)
  Utils.save_term_to_file(next_registration_file, next_registration_term)
  Utils.save_term_to_file(next2_registration_file, next2_registration_term)

rescue Exception
  exit
end
