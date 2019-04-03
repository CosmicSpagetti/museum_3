class Museum
  attr_reader :name,
              :exhibits,
              :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommended = []
    patron.interests.each do |interest|
      recommended << @exhibits.find_all{|exhibit| exhibit.name == interest}
    end
    recommended.flatten
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    new_hash = {}
    @patrons.each do |patron|
      @exhibits.each do |exhibit|
      recommend_exhibits(patron).each do |recommended|
        if exhibit == recommended
        new_hash[@exhibits] = patron
        else
          end
        end
      end
      end
  end
end 
