require 'yaml'
require 'ostruct'

class MusicParser
  # Implement a method parse the contents of a YAML file and return
  # an object whose values are accessible using the [] operator or method calls
  #
  # Note: Use of the YAML library is fine (encouraged, even) but please don't
  #       use any third-party gems that enable the required functionality.
  def self.parse(filename)
    music = MusicParser.hashToMethodAccessible(YAML.load_file(filename))
  end

  def self.hashToMethodAccessible(object)
    return case object
             # Determine whether the object is Hash top level
             when Hash
               object = object.clone
               object.each do |key, value|
                 # using recursion we call the method again in case there are more
                 # nested values if it is an array then the next case for Array takes over
                 object[key] = hashToMethodAccessible(value)
               end
               # Call the open struct lib which comes with Ruby to create
               # the appropriate object
               OpenStruct.new(object)
            # or if its a nested array within the object such as artists
             when Array
               object = object.clone
               object.map! { |i| hashToMethodAccessible(i) }
             else
               # for simple or final case return the object
               object
           end
  end
end