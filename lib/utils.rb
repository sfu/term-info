module Utils
  extend self
  
  def today
    Date.today
  end

  def registration_date(start_at)
    #Spiral term date 10 weeks or 70 days before start of next term
    Date.parse(start_at) - 70
  end

  # Used for Spiral to determine which term it can export to CQ
  # Usually it's 2 weeks after the Calendar is launched to allow some room for editing
  def registration_spiral_date(start_at)
    #Registration date 8 weeks or 56 days before start of next term
    Date.parse(start_at) - 56
  end

  def save_term_to_file(filename, term)
    file = File.open(filename, 'w+')
    name = term.name.downcase.split(" ")
    file.write("#{name.last}/#{name.first}")
  end  
end  
