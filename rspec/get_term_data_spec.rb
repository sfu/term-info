require "rspec"
require "socket"
require "net/http"
require "net/https"
require "httpclient"
require "uri"
require "json"
require "../lib/canvas"
require "../lib/utils"
require "../lib/term"

describe 'Get terms from Canvas' do

  before do
    @current_term = Term.new("current")
    @next_term = Term.new("next")
    @next_registration_term = Term.new("next/2")
  end

  it 'should get current term' do
    @current_term.eql? "2014/spring"
  end

  it 'should get next term' do
    @next_term.eql? "2014/summer"
  end

  it 'should get next next term' do
    @next_registration_term.eql? "2014/fall"
  end

  it 'should set registration term' do
    if Utils.today > Utils.registration_date(@current_term.start_at)
      @registration_term = @next_term
    end
    @registration_term.eql? "2014/summer"
  end

end