module Utils
  extend self
  
  def today
    Date.today
  end

  def registration_date(start_at)
    #start_date = DateTime.parse(start_at)
    #start_date - 70
    #Registration date 10weeks or 70days before start of next term
    Date.parse(start_at) - 70
  end

  def save_term_to_file(filename, term)
    file = File.open(filename, 'w+')
    name = term.name.downcase.split(" ")
    file.write("#{name.last}/#{name.first}")
  end  
end  
