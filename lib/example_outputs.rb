# This is where a handful of examples were executed
# You'll find a variety of examples that support the theory
# that Flyweight does indeed save space.
# ***I kept the same singletons alive during these tests

wp = WordProcessor.new

# Small
wp.unicode_values = 200.times.map do
  rand(97..122)
end
wp.run_array.append_run(100, { font_name: 'Times New Roman', font_size: 12, font_style: 'bold' })
wp.run_array.append_run(150, { font_name: 'Ariel', font_size: 16, font_style: 'bold' })
wp.run_array.append_run(200, { font_name: 'Times New Roman', font_size: 16 })
wp.calculate_size
# Total allocated: 78648 bytes (363 objects)
# Total retained:  32944 bytes (166 objects)


wp.strategy = NonFlyweightStrategy.new
wp.calculate_size
# Total allocated: 62400 bytes (600 objects)
# Total retained:  62400 bytes (600 objects)


#################################################################################################################
# Medium
wp.unicode_values = 2000.times.map do
  rand(97..122)
end
wp.run_array.append_run(100, { font_name: 'Times New Roman', font_size: 12, font_style: 'bold' })
wp.run_array.append_run(150, { font_name: 'Ariel', font_size: 16, font_style: 'bold' })
wp.run_array.append_run(2000, { font_name: 'Times New Roman', font_size: 16 })
wp.calculate_size
# Total allocated: 470032 bytes (2026 objects)
# Total retained:  6032 bytes (26 objects)


wp.strategy = NonFlyweightStrategy.new
wp.calculate_size
# Total allocated: 624000 bytes (6000 objects)
# Total retained:  624000 bytes (6000 objects)


# Large
wp.unicode_values = 20000.times.map do
  rand(97..122)
end
wp.run_array.append_run(100, { font_name: 'Times New Roman', font_size: 12, font_style: 'bold' })
wp.run_array.append_run(150, { font_name: 'Ariel', font_size: 16, font_style: 'bold' })
wp.run_array.append_run(20000, { font_name: 'Times New Roman', font_size: 16 })
wp.calculate_size
# Total allocated: 4640000 bytes (20000 objects)
# Total retained:  0 bytes (0 objects)

wp.strategy = NonFlyweightStrategy.new
wp.calculate_size
# Total allocated: 6240000 bytes (60000 objects)
# Total retained:  6240000 bytes (60000 objects)


# Extra Large
wp.unicode_values = 200000.times.map do
  rand(97..122)
end
wp.run_array.append_run(100, { font_name: 'Times New Roman', font_size: 12, font_style: 'bold' })
wp.run_array.append_run(150, { font_name: 'Ariel', font_size: 16, font_style: 'bold' })
wp.run_array.append_run(200000, { font_name: 'Times New Roman', font_size: 16 })
wp.calculate_size
# Total allocated: 46400000 bytes (200000 objects)
# Total retained:  0 bytes (0 objects)

wp.strategy = NonFlyweightStrategy.new
wp.calculate_size
# Total allocated: 62400000 bytes (600000 objects)
# Total retained:  62400000 bytes (600000 objects)
