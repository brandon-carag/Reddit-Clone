module Sluggable
extend ActiveSupport::Concern


included do
  puts "Sluggable module included. -Brandon"
  after_validation :generate_slug
  class_attribute :slug_column #we're storing the results of sluggable_column here
end


#the question is how it is that I detect which object to pass into the method
def generate_slug
  self.slug=self.send(self.class.slug_column)
  self.slug=self.slug.tr(" /=","_")
end

def to_param
  generate_slug
end


module ClassMethods
  
  def sluggable_column(col_name) #note the col_name is being passed in being set at the model level
    self.slug_column=col_name
  end

end

end

#What is unclear to me.  When generati