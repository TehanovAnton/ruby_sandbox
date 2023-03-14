
def iterate_numbers(&block)
  (0..9).each do |number|
    p block.call(number)
  end
end

iterate_numbers do |number|
  number**2
end
