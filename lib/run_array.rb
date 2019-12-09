class RunArray
  attr_accessor :font_array

  def initialize
    @font_array = []
  end

  def add_run(starting, ending, font)
    font_array.push(build_object(starting, ending, font))
  end

  def append_run(ending, font)
    font_array.push(build_object(get_last_index, ending, font))
  end

  private

  def build_object(starting, ending, font)
    {
      starting_index: starting,
      ending_index: ending,
      font: font
    }
  end

  def get_last_index
    font_array.present? ? self.last.starting_index : 0
  end
end
