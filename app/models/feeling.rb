class Feeling < ApplicationRecord
  belongs_to :day

  VALUES = %w{ awful bad neutral good wonderful }

  VALUES.each_with_index do |meth, index|
    define_method("#{meth}?") { value == index }
  end

end
