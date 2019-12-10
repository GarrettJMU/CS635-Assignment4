# This is where a handful of examples were executed
# You'll find a variety of examples that support the theory
# that Flyweight does indeed save space

run_array.append_run(100, { font_name: 'Times New Roman', font_size: 12, font_style: 'bold' })
run_array.append_run(150, { font_name: 'Ariel', font_size: 16, font_style: 'bold' })
run_array.append_run(200, { font_name: 'Times New Roman', font_size: 16 })

n.times.map do
  rand(97..122)
end
