module Library::Quality
  def self.included(klass)
    klass.send :extend, ClassMethods
  end

  module ClassMethods
    def global_quality
      "All the #{self.name.pluralize.downcase} are great"
    end
  end
  
  def quality
    "This particular #{self.class.name.downcase} is great"
  end
end

