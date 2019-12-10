require_relative './strategy'

class NonFlyweightStrategy < Strategy
  def calculate_stats(run_array, unicode_values)
    object_to_return = []

    unicode_values.each_with_index do |unicode_value, index|
      current_font = run_array.get_font_for_index(index)

      unicode = CharacterFlyweight.new(unicode_value)
      # font = FontFlyweight.new(current_font)
      object_to_return.push({ font: Font.new, unicode: unicode })
    end

    object_to_return
  end
end
