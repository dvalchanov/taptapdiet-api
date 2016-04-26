class Feeling < ApplicationRecord
  belongs_to :day

  VALUES = %w{ mom dad grandmother grandfather son }

  VALUES.each_with_index do |meth, index|
    define_method("#{meth}?") { value == index }
  end

end


# great/wonderful
# good
# neutral
# bad
# awful