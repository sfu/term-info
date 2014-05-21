class Term

  def initialize(term_code)
    if term_code.eql? "current"
      @term = Canvas::Server.parse_json("#{Canvas::Server.server}/sfu/api/v1/terms/#{term_code}")|| {}
    elsif term_code.eql? "next/2"
      @term = Canvas::Server.parse_json("#{Canvas::Server.server}/sfu/api/v1/terms/#{term_code}").last || {}
    elsif term_code.eql? "next/3"
      @term = Canvas::Server.parse_json("#{Canvas::Server.server}/sfu/api/v1/terms/#{term_code}").last || {}
    else   
      @term = Canvas::Server.parse_json("#{Canvas::Server.server}/sfu/api/v1/terms/#{term_code}").first || {}
    end  
  end

  def id
    @term["id"]
  end

  def start_at
    @term["start_at"]
  end

  def end_at
    @term["end_at"]
  end

  def name
    @term["name"]
  end

end
